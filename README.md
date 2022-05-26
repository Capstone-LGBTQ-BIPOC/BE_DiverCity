![DiverCity_logo](https://user-images.githubusercontent.com/67713820/170523356-d690920c-60e0-4ef3-a7d4-872e16aa350b.png)

# Module 4 Capstone Back End Group Project
# DiverCity: Inclusive Business Guide API Endpoints

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>  
        <li><a href="#versions">Versions</a></li>
        <li><a href="#gems">Important Gems</a></li>
        <li><a href="#set-up">Set Up</a></li>
        </li>
    </li>
    </ul>
    <li>
      <a href="#project-description">About This Project</a>
      <ul>
        <li><a href="#learning-goals-for-project">Learning Goals for Project</a></li>
      </ul>
    </li>
    <li>
      <a href="#api-endpoints">DiverCity Exposed Endpoints</a>
      <details>
        <summary>Available Endpoints</summary>
        <ul>
          <li><a href="#business-index-endpoint">Business Index Endpoint</a></li>
          <li><a href="#business-show-page-endpoint">Business Show Page Endpoint</a></li>
          <li><a href="#posting-business-recommendations">Posting Business Recommendations</a></li>
          <li><a href="#get-business-recommendations">Get Business Recommendations</a></li>
        </ul>
      </details>
    </li>
    <li><a href="#what-is-next">What is next?</a></li>
    <li><a href="#collaborators">Collaborators</a></li>
  </ol>
</details>

----------

## Getting Started

### Versions

- Ruby 2.7.2
- Rails 5.2.8

----------

### Gems

API | [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) | [faraday](https://docs.faradaysec.com/) | [figaro](https://figaro.readthedocs.io/en/latest) |

CI/CD | [GitHub Actions](https://github.com/features/actions) | [Rubocop](https://docs.rubocop.org/rubocop/index.html) |

Testing | [rspec-rails](https://github.com/rspec/rspec-rails) | [pry](https://github.com/pry/pry)  | [simplecov](https://github.com/simplecov-ruby/simplecov) | [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) | [faker](https://github.com/vajradog/faker-rails) | [vcr](https://www.rubydoc.info/gems/vcr/frames) | [webmock](https://github.com/bblimke/webmock) | [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) | [capybara](https://capybara-doc.readthedocs.io/en/latest) |




----------

### Set Up

### API Key

You will need to obtain and incorporate your personal API key:
1. Visit [Yelp Fusion Api](https://www.yelp.com/developers/documentation/v3/get_started) to sign up for an account and get your secure API Key
2. Complete local instalation following the instructions below
3. Run `bundle exec figaro install`, this will create a hiddes config/application.yml file
4. Run `atom config/application.yml` to open the hidden file
5. Add `yelp_key: Bearer your_key` to this file so it can be accesses as this varible name through the application
6. Close the file

### Local set up

Open a terminal session and run the following commands:
1. Clone this repository:`git@github.com:Capstone-LGBTQ-BIPOC/BE_DiverCity.git`
3. Navigate to the newly cloned directory:`cd Capstone-LGBTQ-BIPOC/BE_DiverCity`
4. If bundler is not installed run:`gem install bundler`
5. To install the required Gems run:`bundle install` 
6. If errors occur, check for proper installation and versions of:`bundler`, `ruby`, and `rails`
7. Set up the database locally with:`rails db:{drop,create, migrate, seed}`
8. Open your text editor and check to see that `schema.rb` was created
9. You may also run the RSpec test suite locally with the command `bundle exec rspec` to ensure everything is functioning as expected.


----------

## Project Description
DiverCity: Inclusive Business Guide API Endpoints is the Capstone project for students a the Turing School of Softwarre Design. This repo is the back-end that was designed to consume external APIs and expose relevant data to the front-end team in the format requested through the JSON contract. 

### Learning Goals for Project:

#### Explicit
- Expose an API that consumes data from an external data
- Use ***** RICH explain the mail and background workers
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

#### Implicit
- Project planning
- Reading/Writing documentation
- Time Management/Prioritizing Work
- Break down large project goals into manageable steps
- GitHub workflow and project management tools

----------

## API Endpoints

###  Business index endpoint
##### API Endpoint: `https://immense-falls-83363.herokuapp.com/api/v1/businesses?location=denver&category=food`
![image (6)](https://user-images.githubusercontent.com/67713820/170568372-1edd969f-6e4f-4b9a-8fda-5d708137b1ab.png)
![image (7)](https://user-images.githubusercontent.com/67713820/170568369-d43582d8-e5c8-416f-9818-6233d6a4c2bc.png)


### The Business show page endpoint
##### API Endpoint: `https://immense-falls-83363.herokuapp.com/api/v1/businesses/5G2X2q9p7QFdm-LbyutltQ`
![image (3)](https://user-images.githubusercontent.com/67713820/170568382-e956c65d-59eb-4ed4-a4ca-ab6e64e6b8b9.png)
![image (4)](https://user-images.githubusercontent.com/67713820/170568379-ed939d8f-f2c5-40b6-82a9-031c2402eae0.png)



### Posting business recommendations
##### API Endpoint: `https://immense-falls-83363.herokuapp.com/api/v1/recommendations?business_id=5G2X2q9p7QFdm-LbyutltQ`
![image (10)](https://user-images.githubusercontent.com/67713820/170568311-f8387d68-eb8a-4a20-a610-427588d68bb1.png)
![image (11)](https://user-images.githubusercontent.com/67713820/170568292-6d6f6a5e-3379-4929-83dd-c2f1f9c42fcf.png)



### Get Businesses Recommendations
##### API Endpoint: `https://immense-falls-83363.herokuapp.com/api/v1/recommendations`
![image (8)](https://user-images.githubusercontent.com/67713820/170568367-c358db34-3dfc-4486-9593-ce447aef5ad6.png)
![image (9)](https://user-images.githubusercontent.com/67713820/170568359-54dddd7a-95ca-443e-a45e-ff71f7fb32e6.png)

----------

## What is next

Functionality built into the application that needs API endpoint exposure:
- Endpoint to creator a user account
- Endpoint for a user to add a recommendation for a business


## Collaborators

💻  Joseph Galvin |  [GitHub](https://github.com/jwgalvin) | [LinkedIn](https://www.linkedin.com/in/josephwgalvin) |

💻  Richard LaBrecque |  [GitHub](https://github.com/RichardLaBrecque) | [LinkedIn](https://www.linkedin.com/in/rich-labrecque) |

💻  Tamara Dowis |  [GitHub](https://github.com/wanderlust-create) | [LinkedIn](https://www.linkedin.com/in/tamara-dowis) |




