import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
import '../user_preferences/user_preferences.dart';

class ApiHeader {
  static Future<Map<String, String>> getHeader() async {
    var token = '';

    if (kDebugMode) {
      // token = "53616c7465645f5fe69fd43fa3234c962a5acaa5c5569d0820d924edc3683b40566a55f6cef5dea38c20c70e00c9aec9c935bbe80879883bdc1eda22127ac3121904775f933fd9d2f6524c2f5fb103f4e41f0ea5bd53bb88069581565e8a9aa871d075c70059ae9de48bc92210e9594e6e7de86f9a63f781f6ab359c484ee8f1b027430f008bf12a8c097ddc05b5dfc529b16a04f3f714818e040ded28c7b74b05ea50ca543fde3a414f8110ad9009aeb77a538e02fde60717c40abf948e16ba2a07e4ecf00c035d0fa974ae9108566a7db7dc37513c50cbf4b87a3c43007af90487d6b2f6f8054162ddacd37ef7976fc116d3cd473082d6518485f71624dfa14ca39573b9abd6c1afeeeef18e099818bc92bb71332601e3ebc53baa497a8b9f997debdfbdbede39e074effdd184dd3b4aa660fa0180c9402d6b2d32b6f7e4fa774bc31d4283114f67540b1baa07f2c9e7a411cd8d92e988ee159d1071c2496640b61873b4e2f7fea2d096f1f28ccb166f138577cff38b1fe3fdb15ff7785b3aab7f9c5f4d25864cabe2ed4ba4b761bbc430424b3892e62caf05c5fadf5901495fe4f255e091df3792fabf17f49c3aed1fac0ce5eeaffcfc75a485246d3a95b106cbbe303971c367328a9f133334c78fd402eabf0a1cf01603c573a3d132883951052183a676f2ea15dd9584421ae0652095b2fe9e3aeee797093716f02c852887f045de23e1dc905ffe3d08ef0755eebe41945554e957c2959a5f975bce940403adc58f469354b8abf45f8b8142423444b4683ef8651f405edf5c6f6c085bdc19529acf0a182d0423679ba954a725d15d5095ba9045633f9134f3d423730d7817a553db9ad540e5814eb037366aa44d02d1d3fdd97c0adf31376b1f11bb1c534a5c873a6700c4e89bb23758bb9733326623c6bfe45728de437811aee2ae8a4ad0909d59aa01906e13bf0162699088af1f1d622a6694a2157defeeb6eb8eb91ba57334cf9af9747fdaeb777b2d7aef9a01c1230473a440409786951db5ddca799883802f2cdc501cd83e404bad776eb4219f699d239b72aae247d4aaf884a33d9e2b09ce0e96fb84154a7eaf64f3edf274dbac6f7d730c876e113b91005de232e1e7f264210ee61528b379dff9101b2489004d8cda703e9674a6ddee4dc802caf160cdd0842629b4d3edd7bfe9f56d73ce33149598b6dbf00d5801243a1ae3222a72bb8f0d6631f3aa1bcd77397cefa6e276083c1297495bb9b8112790120edd076ce68ba71e2a3ff357e54187ca42888cbee42f5a0e9a2165ec74d200d96b2333fbe5ac8bba46a7c720fb6c92cbbfcf4ab6084a39d0aa220b0f0af6365acc602bc4bb1e319fde7d4606742211f1b9d22228ed0a7109959da9b2f4a0126e0f3b923dbe006c8e884f2313cd34a845e9ece603bb32e2ce7258b50aa622505964c32bc5cf23e3f7e7156932e10fca4376d109c35cf6fec7da226a487a5ea1822ca3a9f58e5ebef09c6cc6282ee6eff051b6";
      token =
          "53616c7465645f5f809ff27c5ba6fab921d8fee65a7cc98866c11530574f63788a69a6450c77057c34fbb225783e300d5ecd5528f1898b9729b2ec30055fafc7a00b07657afb0d3c577d855b734e59453b7f5dfe2d08fd141782ca42e166b8a13363f2cbbb83c26d2db818f31149b6c39f7538d3cb94b528fd98b84dfbc6f4f1061a64e5b7fec5ba56c4a0662804bb1f1803786a07ede29db3fe679df7ae1c973c0bd0859aa2327ca590d91987db9fee43430ef9b9115e34f133002a7761b34f7a76d5a801492fa5458ddbfd5ca38cf4274442ee5169f615452266f73c05ecb097faf43885b77bd09a122ea5355699df1a583f2ea31052f20a2dacfc0e16be228e5c3d0706bac92e9acc92a35e75566eb163c3e3ce9372be946abc3e3297496ad7b05ba241b14edb0f69469a713a26612d4b536067e72cec8f9cc2d3423055fbdbc0a88c175c9057efd765b957437d586870c97f977a905467d7ea7aa9489fcbd522da5cea944c5b3f66d0250fb27ff9b7f940d54d390aadc2da8ae4f5c22e392b2caba5023b5eb77a21996f6839310928b8b8675a5eefe6e5c62cfc40748aeef924bf49acf878d1c31652b5b04c46219aa5de3c489b5697e57155d441cdd2da0bd225262e018bdef3e600a86e86f69e015bcebe57f53d8451a90f3a7be6facbd937c2833f9aa6c46898066033dd51cae111a6eb61e098df7755c2ff02c066b4e9870da6c8c3ccf4dd007254db6386ca3ff1ea0032fd8a8134d16b0a7c37073aa3a813d54e24d8648dee3d65d36fa55df63c36695c3f03dff40dfeb76a3aa7daf60676376aad6c53a2f3910932ed957278f696f8e3e14de26557edae7efdf58498cff7fe358875aa1fac01b1cf5d35f618cbcb5ffa44da9d2f1dd3e316b68f6aeb4c6816f36a5b47ae5d6c5faa070c9b0d242e870382fb95275e964defa4b09710fa864246898a66fd0a48390279871f464be04a3e65a07020b0bfb8bf00476742b8e132f9ab25c2a4699d93cdc5c0c7bb7f9b4e706b74ed90b88181419ab3948c390c6cb45e96c98e23371838a241180d946885846d273788ab9ca272484e545f35a1da0e9253de270490b05cd5152498e045a8e2be13fb897d52b999efe56e95cc6020df158e5e7f64a51d13724bf6a099fd52688779cce15e450bb0c850bfc5bc594ec5a50e21ba9bcb7c6a2a7ea8790a7ceb09a003f1bb96d3c0935e6fdb8d406c2050a9d96422f7436364e2746178f53acd1659d7d3ef35e9c2d5abc77cc100027aadbbe27962868f48f69bc072df128ff2f218719224e63412cc5c7c6940c4f50449520eae29cde21383687041386b227397805cfa5be9fa6cc0f42c71ebebc87de56990049e75f93128f9d7ed44f663b0828dd213fa37a13143c39fb5635334145d223fddef613ceeb7ce91d53552932d3c09fdd09f13150259c784bbc1196ec4aaa22151c937af4e899716f499af85ca676914ff8bc9eb130cc2817dee2182b4549a1a03ab104bd8391eec3b";
    } else {
      token = html.window.localStorage['access_token'] ??
          await UserPreferences.getUserToken();
      UserPreferences.setUserToken(token);
    }

    final Map<String, String> tokenData = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": 'Bearer $token',
    };
    return tokenData;
  }

  static Future<Map<String, String>> getLoginHeader() async {
    final Map<String, String> login = {
      "Content-type": "application/json",
    };

    return login;
  }
}