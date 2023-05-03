# ScrumManager
Based on Apple's Scrumdinger tutorial.
ScrumManager is an iOS app that helps teams manage their daily scrums. ScrumdManager uses visual and audio cues to indicate when and how long each attendee should speak. The app also displays a progress screen that shows the time remaining in the meeting and creates a transcript that the users can refer to later.

---
### Functionality:
- Add new daily scrum by clicking the "+" button on the top right. There you can write your meeting title, select how long the meeting should be, select a color theme, and add attendees. When you're finished, click the "Add" button on the top right. If you don't want to save any changes, click the "Dismiss" button on the top left. When you're done, you can see a list of your meetings on the main (Daily Scrums) screen. The color matches the selected color theme for each meeting.

<img src="https://user-images.githubusercontent.com/47280443/235986060-13c73cd7-a8e0-497d-b72c-32c97b268f3f.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/235987327-d7658dc1-629f-4b02-9c9d-66cc8826f228.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/235988681-daafa5d2-a3c8-4616-a58d-d0faad74c67e.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/235989452-76271fe5-aa1a-48bf-915a-0166cced6fa6.png" width="20%" height="20%"/>

- By clicking on a daily scrum, you can see the scrum's details. You can edit the details by clicking the "Edit" button in the top right corner. Once you've done editing, click the "Done" button in the top right corner; if you don't want to save changes, click "Cancel" on the top left.
  Notice the "History" section below the attendees' names. Right now it's empty, but once you complete a meeting, you'll be able to see it there.
  When you're ready to start a meeting, click the "Start meeting" button (the first one in "Meeting Info").

<img src="https://user-images.githubusercontent.com/47280443/235993110-8b9cccff-1d38-4783-80ad-8728e058696b.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/235996722-e78ee950-fc73-4fe8-b25f-244a02a87b16.png" width="20%" height="20%"/>

- If you use the app for the first time, you'll be asked to let the app access speech recognition and the microphone. It is needed to let the app write transcripts of meetings. It can be useful to review what was said during each meeting; to let the app do that, click "OK" both times. If you don't need to use this feature and are not comfortable giving access to your microphone, click "Don't Allow".

<img src="https://user-images.githubusercontent.com/47280443/235998700-83d9e598-7208-43b7-9fda-15303ce8b753.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/235998813-87d9a6bc-631f-40b2-8a05-4624e78ad7fd.png" width="20%" height="20%"/>

- When the meeting starts, you can see the timer (in seconds) on the top of the screen. The name of the current speaker is written in the middle of the screen. Once the time dedicated to each speaker is up, you'll hear a "ding" sound that announces that the speaker should change (or the meeting should end). You'll also see a circle in the middle of the screen filled section by section to visually represent how many attendees have finished speaking. If the speaker is done speaking faster than their dedicated time - you can click on the "⏩" button on the bottom of the screen to skip to the next speaker. Once you're ready to finish the meeting, click "<" back to meeting details (the timer allows you to have a meeting for more time if you want to, so it won't close on its own).

<img src="https://user-images.githubusercontent.com/47280443/236001981-5a7418d2-e448-4c78-9992-6a1f80b3f586.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/236002176-a1336d58-d96a-48ce-9a70-8f27fc51cfd7.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/236002278-5ecdb64f-4ddd-4fed-bd02-920aed4b3929.png" width="20%" height="20%"/>

- Now you can see the dates of meetings you've had in the "History" section of your scrum. By clicking the date you want, you can see the list of attendees and transcript (if you've recorded the meeting).

<img src="https://user-images.githubusercontent.com/47280443/236005211-75937dc1-c64a-43fa-9a04-d0ce3d42afbd.png" width="20%" height="20%"/> <img src="https://user-images.githubusercontent.com/47280443/236005306-325bfeda-2cbc-44b8-a1ca-0e9081a55d3f.png" width="20%" height="20%"/>
<img width="22%" src="https://user-images.githubusercontent.com/47280443/236005407-7ad51747-4f0f-4dfd-a53b-7354fcd5a655.png">

---
### Planned features and fixes:
- Allow to delete attendees.
- Show how long each speaker should be prepared to speak.
