Description of Project
======================

[Mapping Expatriate Paris](http://mep.princeton.edu/) (MEP) is a digital
humanities project, sponsored by [the Digital Humanities Center at
Princeton University](http://digitalhumanities.princeton.edu/), that
uses Sylvia Beach’s archives to recreate the world of the Lost
Generation. MEP tracks the membership of the Shakespeare and Company
lending library to reveal what its members read and where they lived.
MEP also captures how the expatriate community in Paris changed from the
end of World War I to the German Occupation of France in 1940, including
its connections to French writers and artists.

This repository contains the primary assets of the project: encoded
transcriptions of a number of documents from the [Sylvia Beach
Papers](http://findingaids.princeton.edu/collections/C0108/) held in the
Manuscripts Division of the [Rare Books and Special Collections
department](http://rbsc.princeton.edu/) of the [Princeton University
Library](http://library.princeton.edu): the Borrowers Cards
<http://findingaids.princeton.edu/collections/C0108/c00584> and the
subscription log books (get link)

The assets from the Sylvia Beach Papers were digitized by the [Princeton
University Library's Digital Photography
Studio](http://library.princeton.edu/division/digital-studio) (get
details, including shooting parameters, conversion parameters, location
of image files). The image files are not available for download; see the
[finding aid](http://findingaids.princeton.edu/collections/C0108/) for
more information about access to the primary materials.

Description of Repository Organization
======================================

transcriptions/
---------------

The primary assets in this repository are the TEI-encoded transcriptions
of the lending-library cards, the subscription logs, and the
personography file. They can all be found in the `transcriptions/`
directory.

### cards/

The encodings of the cards were made by members of the MEP project from
diplomatic transcriptions of the original documents (see `raw/` below).
The encoded files are arranged alphabetically in sub-directories,
corresponding with the diplomatic transcriptions in `raw/`.

### logbooks/

Contains encodings of Beach's subscription logbooks from 1919 through
1941. Each logbook is encoded in a single file whose name indicates the
year of the source document.

### other transcriptions

#### personography.xml

A TEI-encoded file that captures full names, addresses, and other
information about library subscribers using the &lt;person&gt; element.

#### notebook.xml

Beach kept subscription information in several forms. This file is a
simplified, tabular capture of data found in X DOCUMENT.

raw/
----

The raw transcriptions of the cards were made by members of the MEP
project from the original documents and from high-resolution images
produced by Princeton University Library. They are arranged
alphabetically in sub-directories, corresponding with the arrangement of
the digital images.

schemas
-------

The encoding follows the guidelines of the [Text Encoding
Initiative](http://www.tei-c.org). As advocated by the TEI, we have
created a specialized subset of the TEI P5 schema against which to
validate our transcriptions. We have created separate customizations for
the cards, the personography and the log books.

The ODD files formally defining the schema, the schemas themselves
(encoded in the compact syntax of the RELAX-NG schema language), and
HTML files describing the schema in human-readable form, are included in
the `schemas/` directory at the top of this repository.

### Library Cards

The schema file is libcards.rnc.

The major encoded elements are as follows:

-   names
-   dates
-   addresses
-   bibliographic titles

### Log Books

TK

### Personography

TK

db/
---

Contains files to support the loading of MEP data into an eXist XML
database.

### collection.xconf

Standard file declaring indexes to be defined on the MEP collection.

### build.xml

An ant file that may be used to load MEP data into an eXist database. It
will require customization before it may be used (see below).

Installation and Dependency Information
=======================================

Importing data into eXist using ant tasks
-----------------------------------------

You must have Apache Ant 1.9.7 or greater installed to use this
facility. (It is known to work on OS X 10.11 with eXist 3.0RC)

-   change the property exist~home~ to the location of your
    exist installation.
-   change the xmldb.\* properties to match your installation
-   change the approot property to match your installation

Known Issues/Customization Points
=================================

None at this time
