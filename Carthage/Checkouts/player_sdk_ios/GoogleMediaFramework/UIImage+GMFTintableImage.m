// Copyright 2014 Google Inc. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "UIImage+GMFTintableImage.h"

@implementation UIImage (GMFTintableImage)

- (UIImage *)GMF_createTintedImage:(UIColor *)color {
  
  UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextTranslateCTM(context, 0, self.size.height);
  CGContextScaleCTM(context, 1.0, -1.0);
  CGContextSetBlendMode(context, kCGBlendModeNormal);
  CGRect imageRectangle = CGRectMake(0, 0, self.size.width, self.size.height);
  CGContextClipToMask(context, imageRectangle, self.CGImage);
  
  [color setFill];
  CGContextFillRect(context, imageRectangle);
  
  UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return tintedImage;
}

@end
