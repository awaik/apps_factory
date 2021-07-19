# apps_factory

Made with MVVM pattern and Hive cache.

Develop a music management app with Flutter (iOS and Android) based on the
LastFM API. With the help of the app the user should be able to search for artists,
pick one of their top albums and save it locally.
The app should contain the following screens:
1. Main Screen:
    a. All locally stored albums are shown here.
    b. A tap on one of these albums opens a detail-page.
    c. These screens (Main and Detail) should work without having an
    internet connection.
    d. It's possible to open the search screen from this view.
2. Search Page:
    a. On this page it should be possible to search for an artist on the
    LastFMApi.
    b. Furthermore there should be a button next to a text field which starts
    the search.
    c. The results of the search (found artists) should be shown in a list.
    d. A selection of one list-item opens the Top Albums screen.
3. Top Albums:
    a. The best albums of an artist are shown here.
    b. It should be possible to store (and delete stored) albums locally.
    c. Tap on an album opens the detail-page and at least the following
    information should be stored:
i. Name
ii. Artist
iii. Image (size does not matter)
iv. Tracks

You can create your API key on the following website:
https://www.last.fm/api/authentication
