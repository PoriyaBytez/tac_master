import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tac/controllers/LoginController.dart';
import 'package:tac/screens/onboarding_screen.dart';
import 'package:tac/screens/residential/residential_screen.dart';
import 'package:tac/utils/app_colors.dart';
import 'package:tac/utils/app_textstyle.dart';
import '../screens/auth/email_verification_page.dart';
import '../widgets/sized_box.dart';
import 'SharePrefs.dart';
import '../controllers/RegisterController.dart';
import '../models/UserModel.dart';
import '../utils/app_strings.dart';
import '../widgets/TSnackBar.dart';
import 'cloud_firestore_helper.dart';

class FireBaseAuthHelper {
  FireBaseAuthHelper._();

  static final FireBaseAuthHelper fireBaseAuthHelper = FireBaseAuthHelper._();
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "383083949744-n9miackona4ks4504hq2kiej0c4eg98s.apps.googleusercontent.com",
  );
  RegisterController authController = Get.find();
  LoginController loginController = Get.find();

  /// SIGN OUT
  Future<void> signOut() async {
    authController.isLoading.value = true;
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      SpUtil.remove(SpConstUtil.currentUser);
      SpUtil.clear();
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
      await googleSignIn.currentUser?.clearAuthCache();
      authController.isLoading.value = false;
      Get.offAll(() => const OnBoardingScreen());
    });
  }

  /// SIGN IN WITH GOOGLE
  Future<User?> signWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      authController.isLoading.value = true;
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          UserCredential userCredential =
              await firebaseAuth.signInWithCredential(credential);
          User? user = userCredential.user;
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) async {
            dynamic data = documentSnapshot.data();
            log("GOOGLE SIGN IN DATA --> $data");
            if (data == null) {
              UserModel userGoogle = UserModel(
                id: user.uid,
                username: user.displayName ?? "",
                email: user.email ?? "",
              );
              SpUtil.putString(
                  SpConstUtil.currentUser, jsonEncode(userGoogle.toMap()));
              TSnackBar.snackBar(
                title: AppStrings.txtWelcomeApp,
              );
              authController.isLoading.value = false;
              await CloudFirestoreHelper.cloudFirestoreHelper.insertUserDetail(
                email: user.email ?? "",
                password: null,
                name: user.displayName ?? "",
                id: user.uid,
              );
              Get.offAll(() => const ResidentialScreen());
            } else {
              UserModel currentUser = UserModel(
                id: data['id'],
                username: data['username'],
                email: data['email'],
              );
              SpUtil.putString(
                  SpConstUtil.currentUser, jsonEncode(currentUser.toMap()));
              TSnackBar.snackBar(
                title: AppStrings.txtWelcomeApp,
              );
              authController.isLoading.value = false;
              Get.offAll(() => const ResidentialScreen());
            }
          });

          return user;
        } else {
          throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: 'Missing Google Auth Token',
          );
        }
      } else {
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      }
    } catch (error) {
      log("GOOGLE SIGN IN FAILED --> ${error.toString()}");
    } finally {
      authController.isLoading.value = false;
    }
    return null;
  }

  void sendEmailVerification() async {
    User? user = firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      TSnackBar.snackBar(title: AppStrings.txtSentEmailVerification);
    }
  }

  Future<bool> isEmailVerified() async {
    User? user = firebaseAuth.currentUser;
    if (user != null) {
      await user.reload();
      return user.emailVerified;
    }
    return false;
  }

  Future<User?> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      authController.isLoading.value = true;
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await CloudFirestoreHelper.cloudFirestoreHelper.insertUserDetail(
        email: user?.email,
        password: password,
        name: name,
        id: user?.uid,
      );
      Get.offAll(
        EmailVerificationPage(
          name: name,
          password: password,
          email: email,
          id: user!.uid,
        ),
      );
      sendEmailVerification();
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          TSnackBar.snackBar(
            title: AppStrings.errorTxtWeakPass,
          );
          break;
        case 'email-already-in-use':
          TSnackBar.snackBar(
            title: AppStrings.errorTxtEmailAlreadyRegister,
          );
          break;
      }
    } finally {
      authController.isLoading.value = false;
    }
    return null;
  }

  Future<User?> loginUser(
      {required String email, required String password, context}) async {
    try {
      loginController.isLoading.value = true;
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await user?.reload();
      if (user != null && user.emailVerified) {
        UserModel userModel = UserModel(
          email: user.email,
          id: user.uid,
          username: user.displayName,
        );
        SpUtil.putString(
            SpConstUtil.currentUser, jsonEncode(userModel.toMap()));
        Get.offAll(const ResidentialScreen());
        TSnackBar.snackBar(title: AppStrings.txtWelcomeApp);
        return user;
      } else {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Text(
                        AppStrings.txtEmailNotVerified,
                        style: AppTextStyle.bold20(AppColors.blueSmoke),
                      ),
                    ),
                    const Divider(
                      color: AppColors.grey,
                    ),
                    Text(
                      AppStrings.txtResendEmailVerification,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.medium16(AppColors.blueSmoke),
                    ),
                    hBox(1.h)
                  ],
                ),
                actions: [
                  Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 5.5.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1.8)),
                          child: Center(
                            child: Text(
                              AppStrings.btnTxtCancel,
                              style: AppTextStyle.medium14(AppColors.blueSmoke),
                            ),
                          ),
                        ),
                      )),
                      wBox(2.w),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          FireBaseAuthHelper.fireBaseAuthHelper
                              .sendEmailVerification();
                          Get.back();
                        },
                        child: Container(
                            height: 5.5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primaryColor),
                            child: Center(
                              child: Text(
                                AppStrings.btnTxtConfirm,
                                style:
                                    AppTextStyle.medium14(AppColors.whiteColor),
                              ),
                            )),
                      )),
                    ],
                  ),
                ],
              );
            });
        TSnackBar.snackBar(
            title:
                AppStrings.txtEmailVerificationCheck);
      }
    } on FirebaseAuthException catch (e) {
      loginController.isLoading.value = false;
      switch (e.code) {
        case 'wrong-password':
          TSnackBar.snackBar(
            title: AppStrings.errorTxtInvalidCred,
            message: "Please check your email and password",
          );
          SpUtil.clear();
          break;
        case 'user-not-found':
          TSnackBar.snackBar(
            title: AppStrings.errorTxtInvalidCred,
            message: AppStrings.errorTxtEmailPass,
          );
          SpUtil.clear();
          break;
        default:
          TSnackBar.snackBar(
            title: AppStrings.errorTxtInvalidCred,
            message: AppStrings.errorTxtEmailPass,
          );
          SpUtil.clear();
          break;
      }
    } catch (e) {
      loginController.isLoading.value = false;
      TSnackBar.snackBar(
        title: "Login Error",
        message: "$e",
      );
    } finally {
      loginController.isLoading.value = false;
    }
    return null;
  }

  Future<void> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Get.back();
      TSnackBar.snackBar(
        title: AppStrings.txtPasswordReset,
      );
    } catch (e) {
      log('Error sending password reset email: $e');
    }
  }
}

/// LOGIN USERNAME AND PASSWORD FIRESTORE DATABASE
// loginUser({String? userName, String? password}) async {
//   try {
//     loginController.isLoading.value = true;
//     final QuerySnapshot result = await FirebaseFirestore.instance
//         .collection('users')
//         .where('username', isEqualTo: userName)
//         .get();
//
//     final List<DocumentSnapshot> documents = result.docs;
//     if (documents.isNotEmpty) {
//       final user = documents.first.data() as Map<String, dynamic>;
//       if (user['password'] == password) {
//         loginController.isLoading.value = false;
//         UserModel currentUser = UserModel(
//           id: user['id'],
//           username: user['username'],
//           email: user['email'],
//           password: user['password'],
//         );
//         SpUtil.putString(
//             SpConstUtil.currentUser, jsonEncode(currentUser.toMap()));
//         TSnackBar.snackBar(
//             title: "Login", message: "User Login Successfully");
//         Get.offAll(const ResidentialScreen());
//         return;
//       } else {
//         loginController.isLoading.value = false;
//         TSnackBar.snackBar(
//           title: AppStrings.errorTxtWrongPass,
//         );
//       }
//     } else {
//       loginController.isLoading.value = false;
//       TSnackBar.snackBar(
//         title: AppStrings.errorTxtInvalidUser,
//       );
//     }
//   } catch (e) {
//     loginController.isLoading.value = false;
//     log('ERROR LOGIN SCREEN: $e');
//   }
//   return null;
// }

/// DELETE ACCOUNT
// Future<void> deleteAccount({required String password}) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   User? user = firebaseAuth.currentUser;
//   try {
//     authController.isLoading.value = true;
//     if (user != null) {
//       await user.reload();
//       String providerId = user.providerData.first.providerId;
//       if (providerId == 'password') {
//         AuthCredential credential = EmailAuthProvider.credential(
//           email: user.email!,
//           password: password,
//         );
//         await user.reauthenticateWithCredential(credential);
//         await CloudFirestoreHelper.cloudFirestoreHelper
//             .deleteUser(id: user.uid);
//         await prefs.clear();
//       } else if (providerId == 'google.com') {
//         GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//         GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//         AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//         await user.reauthenticateWithCredential(credential);
//       } else if (providerId == 'facebook.com') {
//         final LoginResult result = await FacebookAuth.instance.login();
//         if (result.status == LoginStatus.success) {
//           final AccessToken? accessToken = result.accessToken;
//           final AuthCredential credential =
//           FacebookAuthProvider.credential(accessToken!.token);
//           await user.reauthenticateWithCredential(credential);
//         } else {
//           Get.snackbar("Something went wrong", "");
//           return;
//         }
//       } else if (providerId == "apple.com") {
//         await firebaseAuth.currentUser!
//             .reauthenticateWithProvider(AppleAuthProvider());
//         await CloudFirestoreHelper.cloudFirestoreHelper
//             .deleteUser(id: user.uid);
//         await prefs.clear();
//       }
//       await user.delete();
//       await signOut();
//       authController.isLoading.value = false;
//       Get.snackbar("Account deleted successfully", "");
//       Get.offAll(const SignInPage());
//       authController.isLoading.value = true;
//     } else {
//       Get.snackbar("No user found", "");
//     }
//   } catch (error) {
//     print("$error");
//     Get.snackbar("Account deletion failed", "");
//   } finally {
//     authController.isLoading.value = false;
//   }
// }

/// UPDATE PASSWORD FIRESTORE DATABASE
// Future<void> updatePassword(
//     {required String newPassword, required String currentPassword}) async {
//   User? userEmail = firebaseAuth.currentUser;
//   String? email = userEmail?.email;
//   String password = currentPassword;
//   String updatePassword = newPassword;
//
//   try {
//     authController.isLoading.value = true;
//     UserCredential userCredential =
//     await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email.toString(),
//       password: password,
//     );
//     User? user = userCredential.user!;
//
//     user.updatePassword(updatePassword).then((_) async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('currentPassword', updatePassword);
//       Get.back();
//       Get.snackbar(
//         "Successfully changed password",
//         "",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       authController.isLoading.value = false;
//     }).catchError((error) {
//       Get.snackbar("Password can't be changed", "");
//     });
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       Get.snackbar("No user found for that email", "");
//     } else if (e.code == 'wrong-password') {
//       Get.snackbar("Wrong password provided for that user", "");
//     }
//   } finally {
//     authController.isLoading.value = false;
//   }
// }

/// LOGIN WITH FACEBOOK
// Future<User?> loginWithFacebook() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   try {
//     final LoginResult result = await FacebookAuth.instance.login();
//     if (result.status == LoginStatus.success) {
//       final AccessToken? accessToken = result.accessToken;
//       final AuthCredential credential =
//       FacebookAuthProvider.credential(accessToken!.token);
//       final UserCredential authResult =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       final User? user = authResult.user;
//       if (user != null) {
//         prefs.setBool('isLogin', true);
//         Get.offAll(
//           const HomePage(),
//           arguments: user,
//         );
//         Get.snackbar("Welcome", "");
//         print('Facebook login successful: $user');
//       } else {
//         Get.snackbar("Facebook login failed", "");
//       }
//       return user;
//     }
//   } catch (e) {
//     print('Error during Facebook login: $e');
//     Get.snackbar("$e", "");
//   }
//   return null;
// }
//
// Future<void> verifyPhoneNumber({required String phoneNumber}) async {
//   try {
//     authController.isLoading.value = true;
//     await firebaseAuth.verifyPhoneNumber(
//       phoneNumber: "+91$phoneNumber",
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await firebaseAuth.signInWithCredential(credential);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         if (e.code == 'invalid-phone-number') {
//           Get.snackbar("The provided phone number is not valid", "");
//         }
//       },
//       codeSent: (String? verificationId, int? resendToken) {
//         Get.snackbar("OTP sent", "");
//         authController.verificationId.value = verificationId ?? "";
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         Get.snackbar("Time out", "");
//       },
//     );
//   } catch (e) {
//     print('Error during phone number verification: $e');
//   } finally {
//     authController.isLoading.value = false;
//   }
// }

/// LOGIN WITH PHONE NUMBER
// Future<User?> signInWithPhoneNumber(
//     {required String smsCode, required String verificationId}) async {
//   try {
//     authController.isLoading.value = true;
//     PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
//       verificationId: verificationId,
//       smsCode: smsCode,
//     );
//     UserCredential userCredential =
//     await firebaseAuth.signInWithCredential(phoneAuthCredential);
//     User? user = userCredential.user;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (user != null) {
//       Get.offAll(() => const HomePage());
//       await CloudFirestoreHelper.cloudFirestoreHelper.insertUserDetail(
//         email: user.email ?? "",
//         phoneNumber: user.phoneNumber ?? "",
//         name: user.displayName ?? "",
//         id: user.uid ?? "",
//       );
//       prefs.setBool('isLogin', true);
//       prefs.setString('phoneNumber', user.phoneNumber.toString());
//       Get.snackbar("Welcome To App", "");
//     }
//   } catch (e) {
//     print('Error during phone number verification: $e');
//   } finally {
//     authController.isLoading.value = false;
//   }
//   return null;
// }

/// APPLE LOGIN
// String generateNonce([int length = 32]) {
//   const charset =
//       '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//   final random = Random.secure();
//   return List.generate(length, (_) => charset[random.nextInt(charset.length)])
//       .join();
// }
//
// /// Returns the sha256 hash of [input] in hex notation.
// String sha256ofString(String input) {
//   final bytes = utf8.encode(input);
//   final digest = sha256.convert(bytes);
//   return digest.toString();
// }
//
// Future<User?> signWithApple() async {
//   try {
//     authController.isLoading.value = true;
//     final rawNonce = generateNonce();
//     final nonce = sha256ofString(rawNonce);
//
//     final appleCredential = await SignInWithApple.getAppleIDCredential(
//       scopes: [
//         AppleIDAuthorizationScopes.email,
//         AppleIDAuthorizationScopes.fullName,
//       ],
//       nonce: nonce,
//     );
//
//     final oauthCredential = OAuthProvider("apple.com").credential(
//       idToken: appleCredential.identityToken,
//       rawNonce: rawNonce,
//     );
//     UserCredential userCredential =
//     await FirebaseAuth.instance.signInWithCredential(oauthCredential);
//     User? user = userCredential.user;
//
//     Get.offAll(() => const HomePage());
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('email', user?.email.toString() ?? "");
//     prefs.setBool('isLogin', true);
//     Get.snackbar("Welcome To App", "");
//
//     return user;
//   } catch (error) {
//     print(error.toString());
//   } finally {
//     authController.isLoading.value = false;
//   }
//   return null;
// }
