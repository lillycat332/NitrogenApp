# N<sub>2</sub> Nitrogen 

# What is it?

Nitrogen is a tool for viewing iOS system info. It is written in Swift with SwiftUI, and minimizes use of libr aries where possible.
Currently, it can show battery level and charge state, OS and Kernel version+information, device name + device specs.

<p float="left">
  <img src="https://user-images.githubusercontent.com/54189319/141285732-48f9ccd9-fee3-49e2-aa6f-7c6f41a1c71a.png" width="400">
  <img src="https://user-images.githubusercontent.com/54189319/141285830-36cc958b-74aa-44d4-a007-fba3d3f2f117.png" width="400">
</p>

# Why?

Because 90% of the "spec apps" on the app store are fake, and the ones that aren't don't fit my needs and aren't visually appealing. Apps should fit the platform they are on, and Nitrogen aims to do this by using entirely native Swift code and SwiftUI. Also because learning by doing is way more interesting than tutorial hell.

# Why BSD? Why not [insert other license]?

I used the BSD License because I believe GPL is not truly FOSS due to it's viral license, and BSD is much better in this regard.

# Why is it called Nitrogen?

I dunno, it sounds cool I guess? It's mainly in reference to the old Carbon framework though.

# Will it run on my device?

Probably. It's very lightweight since it does very little computing (it mainly just calls UIDevice and ProcessInfo) but requires iOS/iPadOS 14.0 because of SwiftUI, so if you've got anything iOS 14 or above you're good! In future, the target OS may increase. I am not very experienced with UIKit, and don't really want to use a backport as my way of learning it. If you know UIKit and would like to port it, go ahead.

# How do I install it/Compile it/Is it on the App Store?
Install Xcode. Clone the project into Xcode. Set up the config and your signing certificate/provisioning profile. Set the active scheme to ```NitrogenRelease```. Build for any iOS device, arm64. Install it to your device. No, it isn't on the App Store because I don't have 100 dollars lying around. If you have 100 dollars and would like to give them to me, you're more than welcome.
