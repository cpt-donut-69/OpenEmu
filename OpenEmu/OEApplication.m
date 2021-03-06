//
//  OEApplication.m
//  OpenEmu
//
//  Created by Remy Demarest on 06/08/2016.
//
//

#import "OEApplication.h"

@implementation OEApplication

@dynamic delegate;

- (NSModalSession)beginModalSessionForWindow:(NSWindow *)theWindow
{
    if ([self.delegate respondsToSelector:@selector(application:willBeginModalSessionForWindow:)])
        [self.delegate application:self willBeginModalSessionForWindow:theWindow];

    NSModalSession modalSession = [super beginModalSessionForWindow:theWindow];

    if ([self.delegate respondsToSelector:@selector(application:didBeginModalSessionForWindow:)])
        [self.delegate application:self didBeginModalSessionForWindow:theWindow];

    return modalSession;
}

- (void)endModalSession:(NSModalSession)session
{
    if ([self.delegate respondsToSelector:@selector(applicationWillEndModalSession:)])
        [self.delegate applicationWillEndModalSession:self];

    [super endModalSession:session];

    if ([self.delegate respondsToSelector:@selector(applicationDidEndModalSession:)])
        [self.delegate applicationDidEndModalSession:self];
}

@end
