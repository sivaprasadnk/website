enum Screen { home, contactMe, projects, experience, menu }

extension ScreenExt on Screen {
  String get displayName {
    switch (this) {
      case Screen.home:
        return "";
      case Screen.contactMe:
        return "Contact Me";
      case Screen.projects:
        return "Projects";
      case Screen.experience:
        return "Experience";
      case Screen.menu:
        return "";
    }
  }
}
