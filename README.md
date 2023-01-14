# PorscheCatalog

This app is a tribute to the German auto maker, Porsche. 

It has a list of Porsche cars that I think are most important.

## How it works

First screen: Edited video from the Porsche Youtube channel on the background and a floating text at the botton, not to metion a nice music playing in the backgorund.

List page: This is where all of the models available is found, some like the 911 has an expandable list that takes their past models. In addition to that, a search box is located at the top and a modified TabView ate the botton allowing both to coexist.

Car detailed: This page shows some of the data collected with the Wikipedia API, formatted in a usable way, giving the user the context for each model.

AI working: Here you are presented with the AI trained to recognize the Models available in the list, both camera and library can be selected for the picture origin, and tapping the model at the top leads the user to the list with that model searched.

### App demo

<table>
  <tr>
    <td>First screen</td>
     <td>List page</td>
  </tr>
  <tr>
    <td><img src="https://github.com/Carlossiii/PorscheCatalog/blob/main/Readme/Welcome.gif" width=200 height=433></td>
    <td><img src="https://github.com/Carlossiii/PorscheCatalog/blob/main/Readme/List.gif" width=200 height=433></td>
  </tr>
     <td>Car detailed</td>
     <td>AI working</td>
  </tr>
  <tr>
     <td><img src="https://github.com/Carlossiii/PorscheCatalog/blob/main/Readme/Car.gif" width=200 height=433></td>
    <td><img src="https://github.com/Carlossiii/PorscheCatalog/blob/main/Readme/AI.gif" width=200 height=433></td>
 </tr>
 </table>
 
### What was the objective
 
Since the first months of studying Swift, I was planning on developing something that involves Porsche and I found that telling part of Porsche's history was a good start point.

After some research the Wikipedia API was the chosen one to do the information part. It wasn't easy at first but when you get how it works, it becomes easy. This part improved a lot my knowledge since I had so many struggles to put together in a concise way.

Once everything was great in that area, I went to the AI part. Since I heard about CoreML, I got excited to do something with it and this app was the perfect chance. Unlucky for me, Porsches has a really similar looking and after 300+ images for training and 100+ for testing, the AI only has 50% of accuracy, but it works okay given the work!

So, after a lot of learning, the objective for this app was achieved and surpassed!
