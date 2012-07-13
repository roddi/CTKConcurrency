//
//  CTKConcurrencyTests.m
//  CTKConcurrencyTests
//
//  Created by Ruotger Skupin on 13.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CTKConcurrencyTests.h"

@implementation CTKConcurrencyTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)test01Simple
{
    CTKPersistentHashMap * hashMap = [CTKPersistentHashMap emptyHashMap];
    STAssertNotNil(hashMap, @"there should be a hash map!");
    STAssertTrue([hashMap count] == 0, @"hash map should not have objects!");
    
    CTKReference * ref = [hashMap reference];
    STAssertNotNil(ref, @"there should be a ref of the hash map!");
    
    CTKPersistentHashMap *hashMap2 = [hashMap mapBySettingObject:@"A" forKey:@"1"];
    STAssertNotNil(hashMap2, @"there should be a hash map!");
    STAssertTrue([[hashMap2 objectForKey:@"1"] isEqualToString:@"A"], @"wrong object returned!");
    STAssertTrue([hashMap2 count] == 1, @"hash map should have 1 object!");
    
    CTKPersistentHashMap *hashMap3 = [hashMap2 mapBySettingObject:@"B" forKey:@"2"];
    STAssertNotNil(hashMap3, @"there should be a hash map!");
    STAssertTrue([[hashMap3 objectForKey:@"1"] isEqualToString:@"A"], @"wrong object returned!");
    STAssertTrue([[hashMap3 objectForKey:@"2"] isEqualToString:@"B"], @"wrong object returned!");
}

const NSUInteger kLoopCount = 300 * 100;

- (void)test02Massive
{

    CTKPersistentHashMap * hashMap = [CTKPersistentHashMap emptyHashMap];
    STAssertNotNil(hashMap, @"there should be a hash map!");
    STAssertTrue([hashMap count] == 0, @"hash map should not have objects!");

    for (NSUInteger i=0; i<kLoopCount; i++) 
    {
        NSString *key = [NSString stringWithFormat:@"key_%05d", (int)i];
        hashMap = [hashMap mapBySettingObject:key forKey:key];
        STAssertTrue([[hashMap objectForKey:key] isEqualToString:key], @"wrong object returned!");
    }

    STAssertTrue([hashMap count] == kLoopCount, @"wrong number of objs!");
    
}


- (void)test03MutableDictionary
{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    STAssertNotNil(dict, @"there should be a hash map!");
    STAssertTrue([dict count] == 0, @"hash map should not have objects!");
    
    for (NSUInteger i=0; i<kLoopCount; i++) 
    {
        NSString *key = [NSString stringWithFormat:@"key_%05d", (int)i];
        [dict setObject:key forKey:key];
        STAssertTrue([[dict objectForKey:key] isEqualToString:key], @"wrong object returned!");
    }
    
    STAssertTrue([dict count] == kLoopCount, @"wrong number of objs!");
    
}

@end
