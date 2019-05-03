# README

Ron Swanson Challenge
Using the “Ron Swanson Quotes API” - https://github.com/jamesseanwright/ron-swanson-quotes#ron-swanson-quotes-api

As an internet user I should be able to get Ron Swanson quotes on demand. It should allow me to click a button/image to get a Swanson word of wisdom

As an internet user I should be able get quotes that are a size that I requested.

It should allow me to determine if I want a small, medium or large quote
It should show me a quote that are 4 words or less if I choose small
It should show me a quote that is 5 words to 12 words if I choose medium
It should show me a quote that is 13 words or larger if I choose large
As an internet user I should be able to rate a Ron Swanson Quote. It should let me give it rating of 1 to 5 on a quote. It should not let the same IP address rate more than 1 time

As an internet user I should be able to see the average rating for a Ron Swanson Quote. It should show me the average rating for a quote when displaying the quote

# PROCESS

After looking at the API data, I decided that making live calls to a static data API was not a good idea. The API does not have filtering and there are only 58 quotes so I created a rake task that `could` be used in a cron job to pull in updated quotes.  Additionally, with the need to be able to vote on quotes and no unique ids in the API, saving the quotes locally seemed the best approach.