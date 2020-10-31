# Health_Memo
## Inspiration

Sanford HealthHack 2020 inspired us to identify a problem in health care that millions face around the world - a dreadful user experience when sharing regular updates with your primary care provider. We wanted to take existing technologies and seamlessly integrate them to create a robust, user-friendly, and convenient way to keep track of your health. This is especially helpful for the elderly and people with one or more chronic diseases.

## What it does

Let's say you are 70 years of age and recently had a heart attack. This means you have to check in with your doctor on a regular basis and share updates on your health. Remembering and summarizing past events can be hard and in these fast-paced 15-minute appointments, you might miss key details that could potentially save your life.

Health Memo gives people a way to log their health condition when they feel uneasy or when your smartwatch notices a concerning change in your vitals. The user can create memos using digital assistants and share them with your care provider when you have an appointment with them. The questions in the memo are curated to your condition and what the doctor would like to know. So in your next appointment, they can dig in deeper into the days you were feeling particularly low and ask more personal questions making appointments more productive and effective. 

## How we built it

Using our experience of iOS development and a quick adaptation of Google's Text-to-Speech and Speech-to-Text frameworks, we were able to create a production-quality iOS app to showcase in the demo part of our video submission.

## Challenges we ran into

Initially, we wanted to build Health Memo using just SiriKit. The limitations we came across were Siri's limited ability to either simply launch the app, or launch the app with a set of parameters. Another limitation was that Siri could not respond based on the context on the screen once Siri was invoked. Due to these limitations, implementing a conversational-style interaction with Siri was not viable, and even if it was, it would exclude other devices that run Android - hence a large user base.

So, we shifted our focus to adopt Google's Text-to-Speech and Speech-to-Text APIs. These are not only available on Andriod and iOS devices, but also have an ability to be invoked after the app is launched.

## Accomplishments that we're proud of

Health Memo makes use of the technologies that already exist out there. It takes the user experience and significantly improves it to enable millions to better keep track of their health. Using the app is as easy as launching the app through the digital assistant (Siri, Alexa, Google Assistant, Bixby, etc) and asking to create a memo. Using conversational-style questions, you can answer back and the memo will be saved for you. 

Many patients who we talked to said they will use Health Memo if it was available to download is what makes us proud. Our attention-to-detail and thinking from the user's point-of-view has also been praised by many.

## What we learned

The primary lesson for us from this project was working in a team to identify a great amount of untapped potential in enriching people's lives when an app is executed properly with the right mindset and motivation. We also learned that creating user-centric apps is not difficult. In fact, they encourage more users and in the case of Health Memo that means a greater number of healthy people.

## What's next for Health Memo

We are constantly trying to make the app even better and starting to work on actually publishing it so more and more people can make use of this innovative - yet easy to use - app. We hope the judges for the Sanford HealthHack see as much potential in this as we do. We would love to work with the engineers at Sanford and make Health Memo accessible on more phones.
