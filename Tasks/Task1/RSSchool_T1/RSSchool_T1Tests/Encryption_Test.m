#import <XCTest/XCTest.h>
#import "Encryption.h"

@interface Encryption_Test : XCTestCase
@property(nonatomic, strong) Encryption *encrypt;
@end

@implementation Encryption_Test

- (void)setUp {
    [super setUp];
    _encrypt = [Encryption new];
}

- (void)testNumber1 {
    XCTAssertTrue([@"a" isEqualToString:[self.encrypt encryption:@"a"]]);
}

- (void)testNumber2 {
    XCTAssertTrue([@"io u" isEqualToString:[self.encrypt encryption:@"iuo"]]);
}

- (void)testNumber3 {
    XCTAssertTrue([@"clu hlt io" isEqualToString:[self.encrypt encryption:@"chillout"]]);
}

- (void)testNumber4 {
    XCTAssertTrue([@"imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau" isEqualToString:[self.encrypt encryption:@"ifmanwasmeanttostayonthegroundgodwouldhavegivenusroots"]]);
}

- (void)testNumber5 {
    XCTAssertTrue([@"isieae fdtonf fotrga anoyec cttctt tfhhhs" isEqualToString:[self.encrypt encryption:@"iffactsdontfittotheorychangethefacts"]]);
}

- (void)testNumber6 {
    XCTAssertTrue([@"rlyzatp oxqkps quthvx fyegue qxrvdp ejinnr yfzgzf" isEqualToString:[self.encrypt encryption:@"roqfqeylxuyxjfyqterizzkhgvngapvudnztsxeprfp"]]);
}

- (void)testNumber7 {
    XCTAssertTrue([@"wmgjpnull cyjqlejgi lyhhdzbui wctlsqsbm fxeoxmsvv ovxjeirfm zadysxbhn nxkkbffpn bawobphfy" isEqualToString:[self.encrypt encryption:@"wclwfoznbmyycxvaxagjhtexdkwjqhlojykopldsxesbbnezqmixfpujbssrbfhlgubvfhpfliimvmnny"]]);
}

- (void)testNumber8 {
    XCTAssertTrue([@"hae and via ecy" isEqualToString:[self.encrypt encryption:@"haveaniceday"]]);
}

- (void)testNumber9 {
    XCTAssertTrue([@"fto ehg ee dd" isEqualToString:[self.encrypt encryption:@"feedthedog"]]);
}

- (void)testNumber10 {
    XCTAssertTrue([@"wmgjpnull cyjqlejgi lyhhdzbui wctlsqsbm fxeoxmsvv ovxjeirfm zadysxbhn nxkkbffpn bawobphfy" isEqualToString:[self.encrypt encryption:@"wclwfoznbmyycxvaxagjhtexdkwjqhlojykopldsxesbbnezqmixfpujbssrbfhlgubvfhpfliimvmnny"]]);
}

- (void)testNumber11 {
    XCTAssertTrue([@"juvcfu qsvvsx lftmkm vkcoqq imbckr zunjyu zelvl" isEqualToString:[self.encrypt encryption:@"jqlvizzusfkmuevvtcbnlcvmocjvfskqkyluxmqru"]]);
}

- (void)testNumber12 {
    XCTAssertTrue([@"bwdfqujs ghcjvkid wtkazxwi dwrufykz yhgktppu yuygibhe gsbsykka tfonpgjz mezgqht" isEqualToString:[self.encrypt encryption:@"bgwdyygtmwhtwhusfedckrgybozfjaukgsngqvzftiypqukxypbkghjiwkphkjtsdizueaz"]]);
}


@end
