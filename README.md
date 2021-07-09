<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Issues][issues-shield]][issues-url]
<!-- PROJECT LOGO -->
<br/>

<p align="center">
  <a href="https://github.com/Love-Rangers/couplistic_frontend">
    <img src="https://github.com/Love-Rangers/couplistic_frontend/blob/main/.github/couplistic_logo.png">
  </a>
  <p align="center">
    Plan a date, see the day, visualize your love.
    <br />
    <a href="https://github.com/Love-Rangers/couplistic-be/issues">Report Bug</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#endpoints">Endpoints</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contributors">Contributors</a></li>
    <li><a href="#license">License</a></li>
  </ol>
  
</details>
<!-- ABOUT THE PROJECT -->

## About The Project
<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->
Couplistic is a romantic event planner. It utilizes the [Ticketmaster](https://developer.ticketmaster.com/products-and-docs/apis/getting-started/) and [Weather](https://www.weatherapi.com/) APIs to dynamically generate event and daily weather information that a user queries. Search available events and see that day's current weather. Then, add that event to your personal calendar and look forward to having fun with your partner!
<br> 
<br>
The Couplistic backend is an API that aggregates ticket and weather data to its partner frontend application. The frontend repo is located [here](https://github.com/Love-Rangers/couplistic_frontend).

### Built With
* [RubyOnRails](https://rubyonrails.org/)
* [Travis](https://www.travis-ci.com/)
* [Faraday](https://github.com/lostisland/faraday)
* [Figaro](https://github.com/laserlemon/figaro)
* [Factory Bot](https://github.com/thoughtbot/factory_bot)
* [Faker](https://github.com/faker-ruby/faker)
* [Fast JSON API](https://github.com/Netflix/fast_jsonapi)
* [Timecop](https://github.com/travisjeffery/timecop)

* [RSpec](https://rspec.info/)
* [Simplecov](https://github.com/simplecov-ruby/simplecov)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Shoulda-Matchers](https://github.com/thoughtbot/shoulda-matchers)
* [Webmock](https://github.com/bblimke/webmock)
* [VCR](https://github.com/vcr/vcr)

###### Initial Setup
1. Fork this repo
2. Clone down your fork
   ```sh
   git clone git@github.com:your-username/couplistic-be.git
   ```
3. Install dependencies
   ```sh
   bundle install
   ```
4. Create PostgreSQL database
   ```sh
   rake db:{create,migrate}
   ```
## Getting Started
1. Register for [Ticketmaster](https://developer.ticketmaster.com/products-and-docs/apis/getting-started/) and [Weather](https://www.weatherapi.com/) API keys.
  
2. Install Figaro
   ```sh
   bundle exec figaro install
   ```
3. Open application.yml
   ```sh
   code application.yml OR atom application.yml (for vscode/atom code editors)
   ```
4. Retrieve and paste in ticketmaster and weather API keys as pictured: 

    <a href="https://github.com/Love-Rangers/couplistic_frontend">
       <img src=".github/be-app-yml.png" alt="Logo" width="360" height="40">
    </a>
  
5. Initialize rails server
   ```sh
   rails s
   ```
<!-- Endpoints -->
## Endpoints
*Utilize [Postman](https://www.postman.com/) or localhost:3000 to call endpoints:*

  1. GET /api/v1/ticketmaster?city=#{city}&keyword=#{keyword}  
      returns the available events and tickets for a specified city and keyword. Swap city and keyword with your own values.
      
  2. GET /api/v1/weather?q=#{location} 
      returns the weather forecast and moon information for a passed location. Swap location with a location of your choosing.
      
## Roadmap
The team utilized a [github project board](https://github.com/orgs/Love-Rangers/projects) to organize project issues and coordinate workflow across 5 members and 2 repositories.
See the [open issues](https://github.com/Love-Rangers/couplistic-be/issues) for a list of proposed features (and known issues).

<!-- CONTRIBUTING -->
## Contributing
Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**. We hope that users provide input to improve their experience and that of others.

###### Versions
- Ruby 2.5.3
- Rails 5.2.6
  
###### Making a Contribution
1. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
2. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
3. Push to the Branch (`git push origin feature/AmazingFeature`)
4. Open a Pull Request from your fork to this main repo

<!-- CONTRIBUTORS -->
### Contributors
Austin Andrade [![Github][github-shield]][austin-github-url] [![LinkedIn][linkedin-shield]][austin-linkedin-url] [![Email][email-shield]][austin-email-url] <br>
Brisa Garcia [![Github][github-shield]][brisa-github-url] [![LinkedIn][linkedin-shield]][brisa-linkedin-url] [![Email][email-shield]][brisa-email-url] <br>
Kseniya Kudzelich [![Github][github-shield]][kseniya-github-url] [![LinkedIn][linkedin-shield]][kseniya-linkedin-url] [![Email][email-shield]][kseniya-email-url] <br>
Mike Foy [![Github][github-shield]][mike-github-url] [![LinkedIn][linkedin-shield]][mike-linkedin-url] [![Email][email-shield]][mike-email-url] <br>
Ryan Stemmle [![Github][github-shield]][ryan-github-url] [![LinkedIn][linkedin-shield]][ryan-linkedin-url] [![Email][email-shield]][ryan-email-url] <br>

<!-- LICENSE -->
## License
Distributed under the WeatherAPI, Ticketmaster and Spotify for devs Licenses. See [LICENSES](https://github.com/Love-Rangers/couplistic-be/tree/main/.github/licenses) for more information.
<!-- CONTACT -->

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Love-Rangers/couplistic-be.svg?style=for-the-badge
[contributors-url]: https://github.com/Love-Rangers/couplistic-be/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Love-Rangers/couplistic-be.svg?style=for-the-badge
[stars-shield]: https://img.shields.io/github/stars/Love-Rangers/couplistic-be.svg?style=for-the-badge
[stars-url]: https://github.com/Love-Rangers/couplistic-be/stargazers
[issues-shield]: https://img.shields.io/github/issues/Love-Rangers/couplistic-be?style=for-the-badge
[issues-url]: https://github.com/Love-Rangers/couplistic-be/issues

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[github-shield]: https://img.shields.io/badge/-Github-black.svg?style=for-the-badge&logo=github&colorB=555
[email-shield]: https://img.shields.io/badge/-Email-black.svg?style=for-the-badge&logo=gmail&colorB=555

[austin-github-url]: https://github.com/austinandrade/
[brisa-github-url]: https://github.com/brisag
[kseniya-github-url]: https://github.com/gitkseniya
[mike-github-url]: https://github.com/foymikek
[ryan-github-url]: https://github.com/r-stemmle

[austin-email-url]: mailto:austinmandrade@gmail.com?subject=Hello%20Austin
[brisa-email-url]: mailto:brisagarciaglz@gmail.com?subject=Hello%20Brisa
[kseniya-email-url]: mailto:kseniya.kudelich@gmail.com?subject=Hello%20Kseniya
[mike-email-url]: mailto:foymikek@gmail.com?subject=Hello%20Mike
[ryan-email-url]: mailto:ryanstemmle@gmail.com?subject=Hello%20Ryan

[austin-linkedin-url]: https://www.linkedin.com/in/austinandrade/
[brisa-linkedin-url]: https://www.linkedin.com/in/brisa-garcia-gonzales-6b604385/
[kseniya-linkedin-url]: https://www.linkedin.com/in/kseniyakudzelich/
[mike-linkedin-url]: https://www.linkedin.com/in/michael-foy-707ba7b4/
[ryan-linkedin-url]: https://www.linkedin.com/in/rstemmle/
