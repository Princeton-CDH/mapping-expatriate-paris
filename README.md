Description of Project
======================

[Mapping Expatriate Paris](http://mep.princeton.edu/) (MEP) is a digital
humanities project, sponsored by the [Center for Digital Humanities at
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
Library](http://library.princeton.edu): the [Borrowers Cards, A-Z, 1922-1961](http://findingaids.princeton.edu/collections/C0108/c00584) and the
subscription log books filed with [Inventories, Order Records, Clients, 1919-1949](http://findingaids.princeton.edu/collections/C0108/c02186).

The assets from the Sylvia Beach Papers were digitized by the
[Princeton University Library's Digital Photography Studio](http://library.princeton.edu/division/digital-studio). The
image files are not available for download; see the
[finding aid](http://findingaids.princeton.edu/collections/C0108/) for
more information about access to the primary materials.

Repository Organization
=======================

transcriptions/
---------------

The primary assets in this repository are the TEI-encoded transcriptions
of the lending-library cards and the subscription logs, and the
personography file. They can all be found in the `transcriptions/`
directory.

### cards/

The encodings of the cards were made by members of the MEP project from
diplomatic transcriptions of the original documents (see `raw/` below).
The encoded files are arranged alphabetically in sub-directories,
corresponding with the diplomatic transcriptions in `raw/`.

### logbooks/

Contains encodings of Beach's subscription logbooks from 1919 through
1941. Each logbook is encoded in a single file whose name indicates
the year of the source document. (*NB* Some of the logbook files are
empty stubs; we have not encoded all of them yet.)

### other transcriptions

#### personography.xml

A TEI-encoded file that captures full names, addresses, and other
information about library subscribers using the &lt;person&gt; element.

#### notebook.xml

Beach kept subscription information in several forms. This file is a
simplified, tabular capture of data found in an address book: [Addresses, Subscribers before 1936 Summer (Box 69, folder 4)](http://findingaids.princeton.edu/collections/C0108/c02210)


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

The schema file is beachLogs.rnc.

The major encoded elements are as follows:

-  years, months, and days
-  names
-  events
-  measures (duration, frequency, price, deposit)

### Personography

The schema file is personography.rnc

The major encoded elements are *persons*, arranged in two *listPerson* elements, one for subscribers, and one for other persons of interest (especially those mentioned on cards).

db/
---

Contains files to support the loading of MEP data into an eXist XML
database.

### collection.xconf

Standard file declaring indexes to be defined on the MEP collection.

### build.xml

An [ant](http://ant.apache.org/) file that may be used to load MEP data into an eXist database. It
will require customization before it may be used (see below).

Installation and Dependency Information
=======================================


Importing data into eXist using ant tasks
-----------------------------------------

You may use a variety of methods to import MEP data into eXist.  The
easiest method is to use Apache Ant and the build.xml file included in
the db/ directory.


You must have [Apache Ant](http://ant.apache.org/) 1.9.7 or greater installed to use this
facility. (It is known to work on [Mac OS X 10.11](http://www.apple.com/osx/) with [eXist 3.0RC](https://bintray.com/existdb/releases/exist/3.0.RC1/view/files#files/))

Customize build.xml as outlined below.  Then, from the command line, run

`ant install`


Known Issues/Customization Points
=================================

You *must* customize build.xml before using ant to import MEP data into eXist.

-   change the property eXist_home to the location of your
    exist installation.
-   change the xmldb.\* properties to match your installation
-   change the approot property to match your installation

