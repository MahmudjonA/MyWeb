class ProjectsUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLimk;
  final String? iosLink;
  final String? webLimk;
  ProjectsUtils(
      {required this.image,
      required this.title,
      required this.subtitle,
      this.androidLimk,
      this.iosLink,
      this.webLimk});
}

List<ProjectsUtils> hobbyProjectsUtils = [
  ProjectsUtils(
      image: 'assets/projects/project.jpg',
      title: "Something",
      subtitle: "subtitle"),
  ProjectsUtils(
      image: 'assets/projects/project.jpg',
      title: "Something",
      subtitle: "subtitle"),
  ProjectsUtils(
      image: 'assets/projects/project.jpg',
      title: "Something",
      subtitle: "subtitle"),
  ProjectsUtils(
      image: 'assets/projects/project.jpg',
      title: "Something",
      subtitle: "subtitle")
];

List<ProjectsUtils> workProjectUtils = [
  ProjectsUtils(
    image: 'assets/projects/project.jpg',
    title: 'English Brain Craft',
    subtitle:
        'This is an English learning app for students to learn English through various methods.',
    androidLimk:
        'https://play.google.com/store/apps/details?id=kr.co.evolcano.donotstudy',
    iosLink:
        "https://apps.apple.com/kr/app/%EC%98%81%EC%96%B4%EB%A8%B8%EB%A6%AC-%EA%B3%B5%EC%9E%91%EC%86%8C/id1507102714",
  ),
  ProjectsUtils(
    image: 'assets/projects/project.jpg',
    title: 'Online Shop Web App',
    subtitle:
        'This is a responsive online shop web application for car engine oil.',
    webLimk: 'https://www.elo.best',
  ),
  ProjectsUtils(
    image: 'assets/projects/project.jpg',
    title: 'Advertisement Management System',
    subtitle:
        'This is an Advertisement Management System to buy, sell, and manage advertisement.',
    webLimk: 'https://www.externally.unavailable.project',
  ),
];