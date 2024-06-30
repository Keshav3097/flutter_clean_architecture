/// Possible environments for your app
enum Environment {
  /// to be used during local development
  dev,

  /// to be used during local Kubernatics development
  kubeDev,

  /// to be used when deployed as alpha
  //alpha,

  /// to be used when deployed as beta
  //beta,

  /// to be used when deployed as sit
  sit,

  /// to be used when deployed as production
  production,
}