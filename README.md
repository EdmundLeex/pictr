# PICTR
Inspired by EverNote, PICTR is a personal pictures album collection app, where users can collect and organize pictures.

## MVP
PICTR is built using RoR and React.js.
It allows users to:

- [ ] Create account
- [ ] Log in / log out
- [ ] Create albums
- [ ] Upload, view, and delete pictures
- [ ] Write, read, and edit description about Albums
- [ ] Apply complex styling to description
- [ ] Pictures viewed in slide show mode

## Design Docs
* [View Wireframes][view]
* [DB schema][schema]

[view]: ./docs/views.md
[schema]: ./docs/db_schema.md

## Implementation

### MVP

#### Phase 1: MVP Backend Models, User Auth, JSON API (1 days)
In phase 1, backend models, user auth and JSON API needs to be done.
There will also be a unstyled landing page with React rendered user 
auth form. Successful sign up or sign in will redirect user to a new
blank page, which will be the main app page.

* [Details][phase_1]
[phase_1]: ./docs/impl_details/phase_1.md

#### Phase 2: MVP Frontend Flux, Albums CRUD (2 days)
In phase 2, an unstyled albums index page must be finished with basic 
layout structure. User should be able to navigate through a list of
albums, add title, description, and perform basic CRUD actions.
At this stage, new user will be provided a default album.

* [Details][phase_2]
[phase_2]: ./docs/impl_details/phase_2.md

#### Phase 3: Add Search Feature, slideshow, quilljs and Stage 1 CSS (1.5 day)
Phase 3 focuses on adding search feature, slideshow, complex text edit
and touch up basic stying for MVP.

* [Details][phase_3]
[phase_3]: ./docs/impl_details/phase_3.md

### Bonus:

#### Phase 1: Google Map Show Pictures' Locations
In this phrase, I will integrate google map, and show pictures location.
And create a new view to show google map and all the pictures.

* Add geolocation column to pictures
* Use exifr. If meta-data not available, get current geolocation from
browser.
* Full page map, left side show picture thumbnails.
* Click picture will show large picture

### Phase 2: Drag and Drop
* In this phrase, implement drag and drop. Users are allowed to drag and
drop image files when create/edit album.
* After that, implement drap and drop pictures from album to album

### Phase 3: Full Screen Slideshow
* Add fullscreen slideshow function

### Phase 4: Share
Add share feature where users can share pictures/albums with other users.


