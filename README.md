# ParsePort 

A killswitch for Parse. Have your app talk to your servers instead when you
outgrow Parse, all without shipping a new binary or changing a line of code.

Parse is an incredible platform that removes a lot of headache for building 
backend services for your apps. As great as Parse is, using it unfortunately
locks you into their platform in perpetuity, i.e. As long as you have users
in the wild with app binaries using the Parse SDK you're stuck with Parse.

There are a number of reasons for wanting to avoid vendor lock in including:

- Parse is great today, but there are no guarantees the same team will be there
  in the future delivering a service of the same quality.

- Parse can change their pricing at anytime making it catastrophically
  expensive for your app overnight.

- Parse or its owner Facebook could begin to abuse their priveleged access to
  all Parse app metrics to act anti-competitively, e.g. by using the information
  unfairly in M&A. For more on this see http://swaggadocio.com/post/60416244109

## Usage

When you first use ParsePort you'll be happy for your app to use Parse, but
ParsePort allows you to build in the flexibility to leave Parse later without
cutting a new app binary. A good strategy is to pair ParsePort with 
[GroundControl](https://github.com/mattt/GroundControl) by the prolific
[Mattt Thompson](https://github.com/mattt), 

### Client code

In your application delegate `application:didFinishLaunchingWithOptions` method:

```obj-c
#import <ParsePort.h>

NSString * const kParsePortURL = @"parsePortURL"

NSURL *URL = [NSURL URLWithString:@"http://example.com/defaults.plist"];

[[NSUserDefaults standardUserDefaults] registerDefaultsWithURL:URL];

NSURL * parsePortURL = [[[NSUserDefaults] standardUserDefaults]]
                                          URLForKey:kParsePortURL];
                                          
if(parsePortURL) [ParsePort useURL:[NSURL URLWithString:parsePortURL]];
```

### Server Code

The following Sinatra app will force the Parse SDK to talk to your servers
without having to release a new app binary.

```ruby
require 'sinatra'
require 'plist'

get '/defaults.plist' do
  content_type 'application/x-plist'

  { parsePortURL: 'http://api.example.com/' }.to_plist
end
```

### Caveats

This is only the client portion of a Parse migration. In true lean fashion
I haven't built the server component because I don't need it yet; I'm very
happy with Parse but the peace of mind knowing I have the option of a simpler
migration should the need arise makes me sleep easier at night.

If the time comes when I need to move apps from Parse, I would start by looking
at [Helios](https://github.com/helios-framework/helios) (again by Mattt), and
use some Rack middleware to make any mappings.

### Contact

[@stevegraham](https://twitter.com/stevegraham)




