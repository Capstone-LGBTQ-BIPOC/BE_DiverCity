![DiverCity_logo](https://user-images.githubusercontent.com/67713820/170523356-d690920c-60e0-4ef3-a7d4-872e16aa350b.png)

# Module 4 Capstone Back End Group Project
# DiverCity: Inclusive Business Guide API Endpoints

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#set-up">Set Up</a></li>
        <li><a href="#versions">Versions</a></li>
        <li><a href="#gems">Important Gems</a></li>
        <li><a href="#use-of-this-repository">Use of this Repository</a>
          <ul>
            <li>Backend Server</li>
          </ul>
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
      <a href="#apis">DiverCity</a>
      <details>
        <summary>Available Endpoints</summary>
        <ul>
          <li><a href="#business-index-endpoint">Business Index Endpoint</a></li>
          <li><a href="#business-show-page-endpoint">Business Show Page Endpoint</a></li>
          <li><a href="#users-endpoints">Users Endpoints</a></li>
        </ul>
      </details>
    </li>
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

On your local system, open a terminal session to run the following commands:
1. Clone this repository:`git@github.com:Capstone-LGBTQ-BIPOC/BE_DiverCity.git`
3. Navigate to the newly cloned directory:`cd Capstone-LGBTQ-BIPOC/BE_DiverCity`
4. If bundler is not installed run:`gem install bundler`
5. To install the required Gems run:`bundle install` 
6. If errors occur, check for proper installation and versions of:`bundler`, `ruby`, and `rails`
7. Set up the database locally with:`rails db:{drop,create, migrate, seed}`
8. Open your text editor and check to see that `schema.rb` was created.
9. You may also run the RSpec test suite locally with the command `bundle exec rspec` to ensure everything is functioning as expected.













## The Index
![business_index](assets/images/business_index_request.png)
![business_index](assets/images/business_index_request_body.png)
## The Business Show Page
![business_index](assets/images/business_show_request.png)
![business_index](assets/images/business_show_body.png)
![business_index](assets/images/business_show_body_2.png)

## Posting Recommendations
![business_index](assets/images/business_show_request.png)


## Get Businesses Recommendations
