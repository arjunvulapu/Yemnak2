#import "Product.h"

#import "ProductCategory.h"
#import "ProductImage.h"
#import "Common.h"
#import "MCLocalization.h"
@implementation Product

@synthesize about, aboutAr, category, descriptionAr, descriptionText, group, images, options, price, productId, restaurant, title, titleAr, comments;

- (id)copyWithZone:(NSZone *)zone {
    Product *copy = [[[self class] alloc] init];
    if (copy) {
        copy.comments = self.comments;
        copy.SelectedDates = self.SelectedDates;
        copy.status=self.status;
        copy.about = self.about;
        copy.aboutAr = self.aboutAr;
        copy.category = self.category;
          copy.company = self.company;
        copy.descriptionAr = self.descriptionAr;
        copy.descriptionText = self.descriptionText;
        copy.group = self.group;
        copy.images = self.images;
        copy.options = self.options;
        copy.price = self.price;
        copy.productId = self.productId;
        copy.restaurant = self.restaurant;
        copy.title = self.title;
        copy.titleAr = self.titleAr;
        copy.quantity = self.quantity;
        copy.brand = self.brand;
copy.suggested = self.suggested;
        copy.booked_dates = self.booked_dates;


    }
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.comments forKey:@"comments"];
    [encoder encodeObject:self.SelectedDates forKey:@"SelectedDates"];
    [encoder encodeObject:self.status forKey:@"status"];

    [encoder encodeObject:self.about forKey:@"about"];
    [encoder encodeObject:self.aboutAr forKey:@"aboutAr"];
    [encoder encodeObject:self.category forKey:@"category"];
       [encoder encodeObject:self.company forKey:@"company"];
    [encoder encodeObject:self.descriptionAr forKey:@"descriptionAr"];
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.group forKey:@"group"];
    [encoder encodeObject:self.images forKey:@"images"];
    [encoder encodeObject:self.options forKey:@"options"];
    [encoder encodeObject:self.price forKey:@"price"];
    [encoder encodeObject:self.productId forKey:@"productId"];
    [encoder encodeObject:self.restaurant forKey:@"restaurant"];
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.titleAr forKey:@"titleAr"];
    [encoder encodeObject:self.suggested forKey:@"suggested"];
    [encoder encodeObject:self.brand forKey:@"brand"];
    [encoder encodeObject:self.booked_dates forKey:@"booked_dates"];

    [encoder encodeObject:[NSNumber numberWithFloat:self.finalPrice] forKey:@"finalPrice"];
    [encoder encodeObject:[NSNumber numberWithInt:self.quantity] forKey:@"quantity"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.comments = [decoder decodeObjectForKey:@"comments"];
        self.SelectedDates = [decoder decodeObjectForKey:@"SelectedDates"];
       self.status = [decoder decodeObjectForKey:@"status"];

        self.about = [decoder decodeObjectForKey:@"about"];
        self.aboutAr = [decoder decodeObjectForKey:@"aboutAr"];
        self.category = [decoder decodeObjectForKey:@"category"];
        self.company = [decoder decodeObjectForKey:@"company"];
        self.descriptionAr = [decoder decodeObjectForKey:@"descriptionAr"];
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.group = [decoder decodeObjectForKey:@"group"];
        self.images = [decoder decodeObjectForKey:@"images"];
        self.options = [decoder decodeObjectForKey:@"options"];
        self.price = [decoder decodeObjectForKey:@"price"];
        self.productId = [decoder decodeObjectForKey:@"productId"];
        self.restaurant = [decoder decodeObjectForKey:@"restaurant"];
        self.title = [decoder decodeObjectForKey:@"title"];
        self.titleAr = [decoder decodeObjectForKey:@"titleAr"];
        self.brand = [decoder decodeObjectForKey:@"brand"];
        self.suggested = [decoder decodeObjectForKey:@"suggested"];

        self.quantity = [[decoder decodeObjectForKey:@"quantity"] intValue];
        self.booked_dates = [decoder decodeObjectForKey:@"booked_dates"];

    }
    return self;
}

- (NSString *)descriptionText {
    if ([[[MCLocalization sharedInstance] language] isEqualToString:KEY_LANGUAGE_EN]) {
        return descriptionText;
    } else {
        return [descriptionAr length] > 0 ? descriptionAr : descriptionText;
    }
}

- (NSString *)title {
    if ([[[MCLocalization sharedInstance] language] isEqualToString:KEY_LANGUAGE_EN]) {
        return title;
    } else {
        return [titleAr length] > 0 ? titleAr : title;
    }
}

+ (Product *)instanceFromDictionary:(NSDictionary *)aDictionary {

    Product *instance = [[Product alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    self.about = [aDictionary objectForKey:@"about"];
    self.aboutAr = [aDictionary objectForKey:@"about_ar"];

    NSArray *receivedCategory = [aDictionary objectForKey:@"category"];
//    if ([receivedCategory isKindOfClass:[NSArray class]]) {
//
//        NSMutableArray *populatedCategory = [NSMutableArray arrayWithCapacity:[receivedCategory count]];
//        for (NSDictionary *item in receivedCategory) {
//            if ([item isKindOfClass:[NSDictionary class]]) {
//                [populatedCategory addObject:[ProductCategory instanceFromDictionary:item]];
//            }
//        }

        self.category = receivedCategory;
    
    self.company = [aDictionary objectForKey:@"company"];
    //    if ([receivedCategory isKindOfClass:[NSArray class]]) {
    //
    //        NSMutableArray *populatedCategory = [NSMutableArray arrayWithCapacity:[receivedCategory count]];
    //        for (NSDictionary *item in receivedCategory) {
    //            if ([item isKindOfClass:[NSDictionary class]]) {
    //                [populatedCategory addObject:[ProductCategory instanceFromDictionary:item]];
    //            }
    //        }
    
    //self.company = receivedCategory2;


    //}
    self.descriptionAr = [aDictionary objectForKey:@"description_ar"];
    self.descriptionText = [aDictionary objectForKey:@"description"];

//    NSArray *receivedGroup = [aDictionary objectForKey:@"group"];
//    if ([receivedGroup isKindOfClass:[NSArray class]]) {
//
//        NSMutableArray *populatedGroup = [NSMutableArray arrayWithCapacity:[receivedGroup count]];
//        for (NSDictionary *item in receivedGroup) {
//            if ([item isKindOfClass:[NSDictionary class]]) {
//                [populatedGroup addObject:[ProductGroup instanceFromDictionary:item]];
//            }
//        }
//
//        self.group = populatedGroup;
//
//    }

    NSArray *receivedImages = [aDictionary objectForKey:@"images"];
    if ([receivedImages isKindOfClass:[NSArray class]]) {

        NSMutableArray *populatedImages = [NSMutableArray arrayWithCapacity:[receivedImages count]];
        for (NSDictionary *item in receivedImages) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [populatedImages addObject:[ProductImage instanceFromDictionary:item]];
            }
        }

        self.images = populatedImages;

    }

//    NSArray *receivedOptions = [aDictionary objectForKey:@"options"];
//    if ([receivedOptions isKindOfClass:[NSArray class]]) {
//
//        NSMutableArray *populatedOptions = [NSMutableArray arrayWithCapacity:[receivedOptions count]];
//        for (NSDictionary *item in receivedOptions) {
//            if ([item isKindOfClass:[NSDictionary class]]) {
//                [populatedOptions addObject:[ProductOption instanceFromDictionary:item]];
//            }
//        }
//
//        self.options = populatedOptions;
//
//    }
    self.price = [aDictionary objectForKey:@"price"];
    self.productId = [aDictionary objectForKey:@"id"];
   // self.brand = [aDictionary objectForKey:@"brand"];

//    NSArray *receivedRestaurant = [aDictionary objectForKey:@"restaurant"];
//    if ([receivedRestaurant isKindOfClass:[NSArray class]]) {
//
//        NSMutableArray *populatedRestaurant = [NSMutableArray arrayWithCapacity:[receivedRestaurant count]];
//        for (NSDictionary *item in receivedRestaurant) {
//            if ([item isKindOfClass:[NSDictionary class]]) {
//                //[populatedRestaurant addObject:[ProductRestaurant instanceFromDictionary:item]];
//            }
//        }
//
//        self.restaurant = populatedRestaurant;
//
//    }
    self.title = [aDictionary objectForKey:@"title"];
    self.titleAr = [aDictionary objectForKey:@"title_ar"];
    self.suggested = [aDictionary objectForKey:@"suggested"];
    self.booked_dates = [aDictionary objectForKey:@"booked_dates"];

}

- (NSDictionary *)dictionaryRepresentation {

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.about) {
        [dictionary setObject:self.about forKey:@"about"];
    }

    if (self.aboutAr) {
        [dictionary setObject:self.aboutAr forKey:@"aboutAr"];
    }

    if (self.category) {
        [dictionary setObject:self.category forKey:@"category"];
    }
    if (self.company) {
        [dictionary setObject:self.category forKey:@"company"];
    }
    if (self.descriptionAr) {
        [dictionary setObject:self.descriptionAr forKey:@"descriptionAr"];
    }

    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }

    if (self.group) {
        [dictionary setObject:self.group forKey:@"group"];
    }

    if (self.images) {
        [dictionary setObject:self.images forKey:@"images"];
    }

    if (self.options) {
        [dictionary setObject:self.options forKey:@"options"];
    }

    if (self.price) {
        [dictionary setObject:self.price forKey:@"price"];
    }

    if (self.productId) {
        [dictionary setObject:self.productId forKey:@"productId"];
    }

    if (self.restaurant) {
        [dictionary setObject:self.restaurant forKey:@"restaurant"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }
    if (self.brand) {
        [dictionary setObject:self.title forKey:@"brand"];
    }
    if (self.suggested) {
        [dictionary setObject:self.title forKey:@"suggested"];
    }
    if (self.booked_dates) {
        [dictionary setObject:self.title forKey:@"booked_dates"];
    }
    if (self.titleAr) {
        [dictionary setObject:self.titleAr forKey:@"titleAr"];
    }

    return dictionary;

}


@end
