# devs
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-15-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

## Setup

Currently, this DEVS project is using the `master` channel of the Flutter SDK.

TODO: Migrate to `beta`

### Clone the project

```
git clone https://github.com/flutterph/devs/
```

### Download dependencies

Open the project in an IDE or text-editor, then run the ff:

```
cd devs
flutter packages get
```

### Run the project for web

```
flutter run -d web
```

### Run the project for mobile

TODO: Add responsiveness for mobile

## Contributing

### #30DaysOfFlutter Activies

#### 1. Add Developer Details (1 Point)
1. Create an new ticket [here](https://github.com/flutterph/devs/issues/new)

Title: Add <your-name> details

Body (Optional): More details about you

2. Fork this repository
3. Clone (or download) the fork repository on your machine
4. Create a new branch

```
git checkout -b <ticket-number>/your-name
```

5. Locate and open the file `assets/data/devs.json`
6. Add your details

```
[
  {
    "name": "Joshua",
    "roles": ["Software Engineer", "Flutter and Dart GDE"],
    "about": "Lorem ipsum"
  },
  {
    "name": "Charles Magno",
    "roles": ["Software Engineer", "Flutter"],
    "about": "Lorem ipsum"
  },
  ...
  // Add here
]
```

7. Commit changes

Add your name

```
git commit -m "Add <your-name> details"
```

8. Push the changes

```
git push origin -u <ticket-number>/your-name
```

9. On Github, open the fork repository

10. Locate the branch

11. Create a pull request

12. Submit pull request for review

### General Contributing

#### 1. Feature Development

1. Comment on the ticket you would like to work on
2. Outline your proposed solution
3. Get feedback from maintainers
4. Work on the feature
5. Create a pull request
6. Submit pull request for review

#### 2. Fixing bugs

1. Comment on the ticket you would like to work on
2. Outline your proposed solution
3. Get feedback from maintainers
4. Work on the bug fix
5. Create a pull request
6. Submit pull request for review


#### 3. Filling bugs

#### 4. Feature requests

1. Create a new [issue](https://github.com/flutterph/devs/issues) using the 'Feature Request 💡' template
2. Fill in the requested information and feel free to add headers if there's anything you think we missed!
3. Submit the new issue


For questions or suggestions, either create a ticket or send us an email at team@flutter.ph.


More on [Contributing](https://github.com/flutterph/devs/blob/master/README.md).

## Commands

### Before creating Pull Request

Format files

```
flutter format --set-exit-if-changed .
```

Analyze files

```
flutter analyze .
```

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="http://joshuamdeguzman.com"><img src="https://avatars.githubusercontent.com/u/20706361?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Joshua de Guzman</b></sub></a><br /><a href="https://github.com/flutterph/devs/commits?author=joshuadeguzman" title="Code">💻</a> <a href="#content-joshuadeguzman" title="Content">🖋</a> <a href="#data-joshuadeguzman" title="Data">🔣</a> <a href="#mentoring-joshuadeguzman" title="Mentoring">🧑‍🏫</a> <a href="https://github.com/flutterph/devs/issues?q=author%3Ajoshuadeguzman" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://digitaljoni.com"><img src="https://avatars.githubusercontent.com/u/2360639?v=4?s=100" width="100px;" alt=""/><br /><sub><b>digitaljoni</b></sub></a><br /><a href="#content-digitaljoni" title="Content">🖋</a> <a href="#mentoring-digitaljoni" title="Mentoring">🧑‍🏫</a></td>
    <td align="center"><a href="https://clueless.netlify.com"><img src="https://avatars.githubusercontent.com/u/10434746?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Vince Ramces Oliveros</b></sub></a><br /><a href="https://github.com/flutterph/devs/commits?author=ram231" title="Code">💻</a> <a href="#content-ram231" title="Content">🖋</a> <a href="https://github.com/flutterph/devs/issues?q=author%3Aram231" title="Bug reports">🐛</a></td>
    <td align="center"><a href="https://github.com/MedwinCorreo"><img src="https://avatars.githubusercontent.com/u/16618565?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Medwin Correo</b></sub></a><br /><a href="#content-MedwinCorreo" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/LordKarlito"><img src="https://avatars.githubusercontent.com/u/37783804?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Karlo Barcelona</b></sub></a><br /><a href="#content-LordKarlito" title="Content">🖋</a></td>
    <td align="center"><a href="http://markbarrientos.com"><img src="https://avatars.githubusercontent.com/u/20177817?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Barrientos Mark Zamie</b></sub></a><br /><a href="#content-zamvar" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/theshook"><img src="https://avatars.githubusercontent.com/u/33286537?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Haji Fernandez</b></sub></a><br /><a href="#content-theshook" title="Content">🖋</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://gitlab.com/nixdorgu"><img src="https://avatars.githubusercontent.com/u/56599165?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Anike Nicole Dorgu</b></sub></a><br /><a href="#content-nixdorgu" title="Content">🖋</a> <a href="https://github.com/flutterph/devs/commits?author=nixdorgu" title="Documentation">📖</a></td>
    <td align="center"><a href="https://github.com/Celesica"><img src="https://avatars.githubusercontent.com/u/10039521?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Celesica</b></sub></a><br /><a href="#content-Celesica" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/keanallen"><img src="https://avatars.githubusercontent.com/u/45480782?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Kean Allen Imam</b></sub></a><br /><a href="#content-keanallen" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/moshOntong-IT"><img src="https://avatars.githubusercontent.com/u/57244338?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Muslimin Ontong</b></sub></a><br /><a href="#content-moshOntong-IT" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/ronealdenila"><img src="https://avatars.githubusercontent.com/u/36373505?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Roneal Denila</b></sub></a><br /><a href="#content-ronealdenila" title="Content">🖋</a></td>
    <td align="center"><a href="https://www.linkedin.com/in/felixjerome-delafuente/"><img src="https://avatars.githubusercontent.com/u/51954937?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Felix Jerome Dela Fuente</b></sub></a><br /><a href="#content-felixjeromedelafuente" title="Content">🖋</a></td>
    <td align="center"><a href="https://github.com/charlzmagno"><img src="https://avatars.githubusercontent.com/u/78673201?v=4?s=100" width="100px;" alt=""/><br /><sub><b>charlzmagno</b></sub></a><br /><a href="#content-charlzmagno" title="Content">🖋</a></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/96RadhikaJadhav"><img src="https://avatars.githubusercontent.com/u/56536997?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Radhika</b></sub></a><br /><a href="#content-96RadhikaJadhav" title="Content">🖋</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
