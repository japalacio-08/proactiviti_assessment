# GNews API Integration

This Rails project integrates with the [GNews API](https://gnews.io/) to search and retrieve news articles based on user input (to get the API TOKEN please register into [GNews API](https://gnews.io/)).

## Prerequisites

- Ruby 3.0.0
- Rails 6.1.4
- Bundler 2.2.25

## Getting Started

1. Clone this repository: `git clone https://github.com/japalacio-08/proactiviti_assessment.git`
2. Navigate to the project directory: `cd proactiviti_assessment`
3. Install dependencies: `bundle install`
4. Switch the development cache: `rails dev:cache` (Check that development cache is runing)
5. Create `.env` file with your `GNEWS_API_TOKEN` (Please check `.env.example` for more info)
6. Start the server: `dotenv rails server` (Don't forget to use `dotenv` command within `rails server` ir will include the env variables)
7. Access the app in your browser at `http://localhost:3000` or `http://localhost:3000/articles` or `http://localhost:3000/articles/search`

## How to use it?

Here's an example query you could use with this project

```
curl http://localhost:3000/articles?query=Bitcoin&by=title&num_rows=10
```

### Parameters

- `query: string[optional]` Contains the keywords, title or author for a clear search (Default is `null`),
- `by: string[optional]` Contains the search criteria, example `title`, `author` (Default is `null`),
- `num_rows: number[options]` Contains the max number of records that API must return (Default is `null`)

### Example Good Response `curl localhost:3000/`
```JSON

{
    "data": [
        {
            "title": "Analysis: Why Republican presidential hopefuls are keeping out of US debt-ceiling squabble",
            "description": "It is the one topic that everyone on Capitol Hill is talking about and yet hundreds of miles away, on the plains of Iowa and the hills of New Hampshire, none of the Republicans vying for the 2024 presidential nomination have even mentioned it.",
            "content": "WASHINGTON, May 3 (Reuters) - It is the one topic that everyone on Capitol Hill is talking about and yet hundreds of miles away, on the plains of Iowa and the hills of New Hampshire, none of the Republicans vying for the 2024 presidential nomination ... [4862 chars]",
            "url": "https://www.reuters.com/world/us/why-republican-presidential-hopefuls-are-keeping-out-us-debt-ceiling-squabble-2023-05-03/",
            "image": "https://www.reuters.com/resizer/icUowk55K4NIeW4RK-vqUJHoJQk=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/WYHMUN2S2JNQVME6V3O7BCOO3Y.jpg",
            "publishedAt": "2023-05-03T15:27:29Z",
            "source": {
                "name": "Reuters",
                "url": "https://www.reuters.com"
            }
        },
        {
            "title": "Kimberly Gill discusses what it was like sitting in “The Jennifer Hudson Show”",
            "description": "Two weeks ago, I traveled to Burbank, California, to sit on the “Happy Place Sofa” with none other than THE Jennifer Hudson.",
            "content": "DETROIT – What a fantastic assignment!\nTwo weeks ago, I traveled to Burbank, California, to sit on the “Happy Place Sofa” with none other than THE Jennifer Hudson.\nI sat in the audience for a taping of her talk show, The Jennifer Hudson Show, and aft... [703 chars]",
            "url": "https://www.clickondetroit.com/news/local/2023/05/02/kimberly-gill-discusses-what-it-was-like-sitting-in-the-jennifer-hudson-show/",
            "image": "https://res.cloudinary.com/graham-media-group/image/upload/f_auto/q_auto/c_thumb,w_700/v1/arc-cf/05-02-2023/t_7453a13429d346c093c5810e56dd4a8d_name_image.jpg?_a=ATCqVhC0",
            "publishedAt": "2023-05-02T22:42:44Z",
            "source": {
                "name": "WDIV ClickOnDetroit",
                "url": "https://www.clickondetroit.com"
            }
        },
        {
            "title": "Why you don't have to worry about a US airline strike disrupting your summer travel plans",
            "description": "American Airlines pilots voted to go on strike Monday. Southwest pilots are holding a strike vote as well. But none of those union members will be allowed to go on strike anytime soon — if at all — under the labor law that applies to airline workers.",
            "content": "New York CNN —\nAmerican Airlines pilots voted to go on strike Monday. Southwest pilots are holding a strike vote as well. But none of those union members will be allowed to go on strike anytime soon — if at all — under the labor law that applies to a... [4078 chars]",
            "url": "https://edition.cnn.com/2023/05/02/business/airline-strike-threat/index.html",
            "image": "https://media.cnn.com/api/v1/images/stellar/prod/230502132037-american-airlines-strike-220323.jpg?c=16x9&q=w_800,c_fill",
            "publishedAt": "2023-05-02T19:32:17Z",
            "source": {
                "name": "Cable News Network",
                "url": "https://edition.cnn.com"
            }
        },
        {
            "title": "$US175 ($243) Check Signed by Steve Jobs in 1976 Is Up for Auction",
            "description": "From humble beginnings came Apple Incorporated, at least according to a check from none other than Steve Jobs that is up for auction. The check was",
            "content": "$US175 ($243) Check Signed by Steve Jobs in 1976 Is Up for Auction\nFrom humble beginnings came Apple Incorporated, at least according to a check from none other than Steve Jobs that is up for auction. The check was written for $US175 ($243) in 1976 —... [1772 chars]",
            "url": "https://www.gizmodo.com.au/2023/05/us175-243-check-signed-by-steve-jobs-in-1976-is-up-for-auction/",
            "image": "https://www.gizmodo.com.au/wp-content/uploads/sites/2/2023/05/03/c42b2fa673158fb2e6fa34641c12eebc.png?quality=80&resize=1280,720",
            "publishedAt": "2023-05-02T17:45:00Z",
            "source": {
                "name": "Gizmodo Australia",
                "url": "https://www.gizmodo.com.au"
            }
        },
        {
            "title": "Shocking Photo Shows Huntsman Spider Still Alive With Half Its Legs Missing",
            "description": "\"She had four legs on one side of her body and none on the other but was still very quick,\" Jul Smith said.",
            "content": "Eight spindly legs are one of a spider's most distinctive features. And yet these resilient arachnids have been known to survive with over half of them missing.\nJul Smith found one such specimen outside her window at her home in Sydney, Australia, wi... [2434 chars]",
            "url": "https://www.newsweek.com/shocking-photo-huntsman-spider-alive-missing-legs-1797884",
            "image": "https://d.newsweek.com/en/full/2229618/4-legged-huntsman-spider.jpg",
            "publishedAt": "2023-05-02T15:58:05Z",
            "source": {
                "name": "Newsweek",
                "url": "https://www.newsweek.com"
            }
        },
        {
            "title": "EXCLUSIVE: Sault landlord owes nearly $400K in unpaid fines",
            "description": "Court documents reveal pair of Sault Ste. Marie rental properties have been slapped with several fire code and building code violations since 2021 — and none have been paid",
            "content": "Court documents reveal pair of Sault Ste. Marie rental properties have been slapped with several fire code and building code violations since 2021 — and none have been paid\nThis 15-unit rental property at 314 Albert Street East was the target of more... [4662 chars]",
            "url": "https://www.sootoday.com/local-news/exclusive-sault-landlord-owes-nearly-400k-in-unpaid-fines-6934285",
            "image": "https://www.vmcdn.ca/f/files/sootoday/images/real-estate/2023-05-01-brognofinesjh02.jpg;w=1200;h=800;mode=crop",
            "publishedAt": "2023-05-02T12:37:00Z",
            "source": {
                "name": "SooToday",
                "url": "https://www.sootoday.com"
            }
        },
        {
            "title": "Check Astrological prediction for May 3, 2023",
            "description": "Daily Horoscope: Astrological prediction for May 3, 2023: Cancer, you have high principles, no doubt about that. The only question at the present time is whether you are prepared to make the necessary compromises and accept half a loaf rather than none.",
            "content": "Gemini, start by building firm foundations: this is no time for fanciful dreamers. Cancer, you have high principles, no doubt about that. The only question at the present time is whether you are prepared to make the necessary compromises and accept h... [3829 chars]",
            "url": "https://indianexpress.com/article/horoscope/horoscope-today-may-3-2023-check-astrological-prediction-for-scorpio-sagittarius-cancer-aries-and-other-signs-8575438/",
            "image": "https://images.indianexpress.com/2023/04/horoscope_3-1-4.jpeg",
            "publishedAt": "2023-05-02T09:30:30Z",
            "source": {
                "name": "The Indian Express",
                "url": "https://indianexpress.com"
            }
        },
        {
            "title": "Leinster hit back at Ronan O'Gara claim ahead of Champions Cup final rematch",
            "description": "Ronan O'Gara believes his side La Rochelle have been coping with a far tougher season than Leinster - but one of the Blues' backroom coaches is having none of",
            "content": "Ronan O'Gara believes his side La Rochelle have been coping with a far tougher season than Leinster - but one of the Blues' backroom coaches is having none of that notion.\nThe two European titans are on a collision course for one another again later ... [2418 chars]",
            "url": "https://extra.ie/2023/05/02/sport/rugby/ronan-ogara-leinster-claim",
            "image": "https://extra.ie/wp-content/uploads/2023/05/leo-cullen-ronan-ogara-leinster-la-rochelle.jpg",
            "publishedAt": "2023-05-02T09:17:47Z",
            "source": {
                "name": "Extra.ie",
                "url": "https://extra.ie"
            }
        },
        {
            "title": "Theme, Date, Hosts, and More News",
            "description": "Here are all the details on the 2023 Met Gala in New York City, which will be co-chaired by none other than Dua Lipa.",
            "content": "The first Monday in May is officially upon us, which means it's time to see our favorite celebs unveil new iconic fashion moments at the Met Gala in New York City. Over the years, A-listers like Zendaya, Rihanna, Billie Eilish, Conan Gray, Timotheé C... [2815 chars]",
            "url": "https://www.seventeen.com/celebrity/a42555302/met-gala-theme-date-date-news-2023/",
            "image": "https://hips.hearstapps.com/hmg-prod/images/metgala-2023-1674062343.png?crop=1.00xw:1.00xh;0,0&resize=1200:*",
            "publishedAt": "2023-05-01T19:03:00Z",
            "source": {
                "name": "Seventeen.com",
                "url": "https://www.seventeen.com"
            }
        },
        {
            "title": "West Virginia Press Box Collapse Sends Nine to Hospital",
            "description": "Six students and three adults were taken for medical attention after the floor of a press box collapsed during a West Virginia softball tournament. None of the...",
            "content": "The partial collapse of a press box floor at a school softball tournament in West Virginia sent nine people to hospitals over the weekend, but none of the injuries appeared to be life-threatening, authorities said.\nSuperintendent of Wayne County Scho... [1340 chars]",
            "url": "https://www.nbcboston.com/news/national-international/west-virginia-press-box-collapse-sends-nine-to-hospital/3034887/",
            "image": "https://media.nbcboston.com/2023/05/Press-Box-Collapse-WSAZ-2.png?resize=1200%2C675&quality=85&strip=all",
            "publishedAt": "2023-05-01T13:33:26Z",
            "source": {
                "name": "NBC10 Boston",
                "url": "https://www.nbcboston.com"
            }
        }
    ]
}
```

### Example Bad Response

```
{
    "errors": "The API key is required."
}
```


## Running the Tests

1. Ensure you have completed the steps in the "Getting Started" section.
2. Run the tests with RSpec: `bundle exec rspec`

## Folder Structure

```
proactiviti_assessment
├── app
│   ├── controllers
│   │   └── articles_controller.rb
│   ├── models
│   │   └── article.rb
├──lib
│   └── g_news
│       └── finder.rb
├── config
│   ├── routes.rb
│   └── database.yml
├── db
│   ├── migrate
│   └── schema.rb
├── spec
│   ├── controllers
│   │   └── articles_controller_spec.rb
│   └── lib
│       └── g_news
│           └── finder_spec.rb
├── .gitignore
├── Gemfile
├── Gemfile.lock
├── README.md
└── Rakefile
```

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).
