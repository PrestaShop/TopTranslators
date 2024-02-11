# [Top Translators](https://translators.prestashop-project.org/)

## About

Top Translators tribute page

This website presents multiple informations about the translators project for PrestaShop: translators ranking, languages completion rates...

## Rendering the site locally

The website source code belongs in `/front` directory.

1. Clone the repository
2. Enter to `/front` repository
3. Run `$ php generate/generate.php > public/index.html` to generate the HTML static website page inside `/front/public` directory

If you want to browse the webpage, use a webserver to serve the content of the `/front/public` directory.

Example using [PHP built-in web server](https://www.php.net/manual/en/features.commandline.webserver.php):
```
$ cd front/public
$ php -S localhost:8000
```
Then browse `localhost:8000`

## Deployment

The website is hosted by GitHub Pages. The [GitHub Action workflow](https://github.com/PrestaShop/TopTranslators/blob/prod/.github/workflows/gh-pages.yml) fetches up-to-date data, format them, build the website and deploy it on `github-pages` environment.

A new deployment is triggered everytime a new commit is pushed on `prod` branch.

## Project structure and workflow

The website is powered by 3 main components:
- Data fetching
- Data computing
- Website building

### Data fetching

As you can see in the [GitHub Action workflow](https://github.com/PrestaShop/TopTranslators/blob/prod/.github/workflows/gh-pages.yml), 3 data files are being fetched from Crowdin API:
   - languages.csv
   - translators_hash.csv
   - translators.csv

These data files contain up-to-date data about the Crowdin PrestaShop project: translators ranking, languages completion rates...

### Data computing

Inside `/csv_to_json` file lies a script whose goal is to compute file `statistics.json` from the above data CSV files. It then places the JSON data file in the `/front/data` directory, to be used in the next step.

### Website building

Inside `/front` directory is a PHP script that builds the static files for the website. It parses the `statistics.json` file and output the final website as an HTML page.

Source code for this application is inside `/front`, the static files are being written into `/front/public` directory.

## About each directory

#### **Config** directory

Folder that contains the settings.json file for the basic configuration of the tool.

Currently, the configuration only allow to change the title for the different levels of contribution
and the number of contributions needed to.

#### **Csv to json** directory

It contains the script that generates the `statistics.json` file that contains the data presented by the website. The data is computed from the CSV export files.

To use this tool:
 - Install the needed dependencies with `npm install`
 - This script need three input files *from the data folder*:
   - flags.csv
   - languages.csv
   - translators.csv
 - Run the scrip `npm start` to generate the `statistics.json` file.

The `statistics.json` file will be moved into the `/public` directory.

#### **Data** directory

This folder contains the raw data of the translators project, which feeds the website (CSV files and the generated JSON).

The needed CSV files for the generator on the `/csv_to_json` folder are:

- **flags.csv**

Sample:
```
Flag,Crowdin,Affichage
EU,Basque,
BRE,Breton,
CAT,Catalan,
QC,"French, Quebec","French, QC"
```
First row ignored.
Three columns that are being parsed:
 - The flag code (used by the front website),
 - The crowdin language name,
 - The display language name, if no display name is set, the crowdin name will be used.

- **languages.csv**

Sample:
```
Croatian,100,DONE,,
Dutch,100,DONE,,
Russian,100,DONE,,
Swedish,100,DONE,,
```

A row is ignored if the second column is not an integer or if the value is less than 1%.
Two columns parsed:
 - The crowdin language name,
 - The completion percent.

- **translators.csv**

Sample:
```
user,language,TOTAL words,Rank,Category,Profile pic,Crowdin link,Website link,GitHub link,Twitter link
A Petapouca (petapouca),Galician,25293,1,1,https://www.gravatar.com/avatar/3fe146dc77a5b5f9a8c17394210baf09?s=150,https://crowdin.com/profile/petapouca,,,
Alper Demir (alper-demir),Turkish,24834,6,1,https://www.gravatar.com/avatar/155283423312fb422acc72b8ef875c38?s=150,https://crowdin.com/profile/alper-demir,,,
```

A row is ignored if the third column is not an integer.
Three columns parsed:
 - The user real name and username (in brackets),
 - The crowdin language name of the user,
 - The translated words count of the user.

#### **Front** directory

The front website.

To compile the static website files, run `php generate/generate.php`. You need a statistics.json file in `front/data` folder.
The PHP script will output an HTML page.
