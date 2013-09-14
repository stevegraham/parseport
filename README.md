# ParsePort 

A killswitch for Parse.

Parse is an incredible platform that removes a lot of headache for building 
backend services for your apps. As great as Parse is, using it unfortunately
locks you into their platform in perpetuity, i.e. As long as you have users
in the wild with app binaries using the Parse SDK your stuck with Parse.

There are a number of reasons for wanting to avoid vendor lock in including:

- Parse is great today, but there are no guarantees the same team will be there
  in the future delivering a service of the same quality.

- Parse can change their pricing at anytime making it catastrophically
  expensive for your app overnight.

- Parse or its owner Facebook could begin to abuse their priveleged access to
  all Parse app metrics to act anti-competitively, e.g. by using the information
  unfairly in M&A. For more on this see http://swaggadocio.com/post/60416244109

## Usage

To force the Parse SDK to communicate with `https://api.example.com/` put the
following code in your application delegate `application:didFinishLaunchingWithOptions`

```obj-c
#import <ParsePort.h>

[ParsePort useURL:[NSURL URLWithString:@"https://api.example.com/"]];
```
