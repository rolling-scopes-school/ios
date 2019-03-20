#import <XCTest/XCTest.h>
#import "Pangrams.h"

@interface Pangrams_Test : XCTestCase
@property (nonatomic, strong) Pangrams *pangrams;
@end

@implementation Pangrams_Test

- (void)setUp {
    [super setUp];
    _pangrams = [Pangrams new];
}

- (void)testStrign1 {
    XCTAssertTrue([self.pangrams pangrams:@"We promptly judged antique ivory buckles for the next prize"]);
}

- (void)testString2 {
    XCTAssertFalse([self.pangrams pangrams:@"We promptly judged antique ivory buckles for the prize"]);
}

- (void)testString3 {
    XCTAssertFalse([self.pangrams pangrams:@"a"]);
}

- (void)testString4 {
    XCTAssertTrue([self.pangrams pangrams:@"qmExzBIJmdELxyOFWv LOCmefk TwPhargKSPEqSxzveiun"]);
}

- (void)testString5 {
    XCTAssertTrue([self.pangrams pangrams:@"NOVmETKPTbYu ftZPEykhjgF GGkdGjWGwW skjPJsea dtwdqcr DERCUgxOxrRgDQbdzL IZjyXs"]);
}

- (void)testString6 {
    XCTAssertTrue([self.pangrams pangrams:@"uIClDDH eBs mSL WXNKJ whnDMS xQDtDlEvJSFfXjAUn uB Nb xS oJNxsRwDboYXz gTjaHoPGrW eLUIHqYdwvTxXdhh nubnZ RvEKaglFnfCgpbdEKoGiKKp EiJJOJePbZIzwvViZOolMn k XHKZSZ C pnfoIQnJznckCwXdmhn Twus xrcFOaNHyisI csGwqQGSVhhVpCnnd kzwViEVDyREYkgyEhXWFrht q DbrLLnNOzuiUibW YHJRDrXJK rXd ezuABu soToNZGssfqpSe FRZMqrNQmkQAWwAHzIy Uik JwLJJDpLPcX jNn neguK RViE wTYMOLDSQaPlKXAjbWzHvgOlaxyxy qQbO GgKaO x lEEpzhopEYApg tcnxQMI FxjclEzttcdTXAxUNWiORidNFIVTaOhSeFHeCEpEiJMEgSI ZHxTbqpZmEo tgmyJyUQeOSWZWhHmnU KlvUNaKXZ WvyRQsOnzP"]);
}

- (void)testString7 {
    XCTAssertFalse([self.pangrams pangrams:@"YaCoVaGAaXxrzUvZ ZaHyacbUZCZUbZxzAYb YefxAwV yyABAdVatYazC TuyYYedxSf aA XBvSg EvYcl badDxvaZXWCyCUAaZvJcyc YdVbDYAdObgc FeCyxpdXxffubDbGAbFBxnzzT WzZ WcBZAaYCgYzseZb PYXbswxchtYIedhyaXtvzVxZSwWBLxxEaAaYAfGzybZzQo AH tCBcszyXZaAgwzYB QdVZBvwzAYbwwAVysxCRdTTT bXzxtWwyXZebEBYNBaDCLbZbwsEAB YTFBAcD bybU axAZAhhay ZkWydfxyGAeAYaZlabazUZssGTBcCXBr dWs XzyZAEzAAZyclC bCGzPfXcCccAFyvazX ZzYAB zAbsuCZADkeWwUuAbaZ zWCtYzgZZBzXXD c VsrbEaG aYYFZJBUlW iXqZxxswaWTJvb Y xuwebj CF zyZYZVdYYdaRyZ bTatyzYZw wVfaZEZauyZ A yo afJeCBAyVDXWBbAxYBzYyiNuWxBbexEcbeVaAqYz XAjawBzEqDzaafz bTaUaAzWYBxXWZzbazbUwYhqCdV DdzyWafztJajczbt CtYVVfzBgdtvXEGyBxy bdZz C xtczZ SZVfW ZCAx aZYDaa cCyZuVUEBGZ ACbawWXdxxLXa EawAgzOABYFbzTf TszVYaDc fACydzZYdAazSaaygBAYbGzdz yyYBYa Vasay xAz A AVWeYXY aTdYCcZIVxxHcWazZyaWaeYZybYUVZ Bu zXwgACWwzXzBaCwAVddb YB aYBBoGXUAcBZPbzVUGtX DeVduXZGXXtOBwagbXZAcDZIDZvTzA yyuUb AZ"]);
}

- (void)testString8 {
    XCTAssertFalse([self.pangrams pangrams:@"CSeBBZvYvDyayyBzdfdXvaBtxxwiXcD jQADzTCXzBxzwcyxbd cdyxcBbcxsVD wzXXzazCeqYyB CZzXyxAb WX zbtAdxRVyWEAB DbdAd ViYxzCSAuCVZVXyZY gfWzczBaAZWzXwy AXyXRvyrRZHxtedwcbAWeYiA ZwBea tQZaTXCoWbE cbtZvWZAziwA BWzBaVGbz yyECVAdAcSizBWgGTBz i BEJDELZ WBbaAEOGwbBcZZAvrYDmCWhT WycaXTatCwzavAwewZAZZWb ezBywzdYBhbZeVZBEZFuiPBafxyYzAdDxBb BcidxCV c oDZxgfbycygBdx y dCY ZEEZ txzasvxZADzcDzxhZzXBbDdaobzDYIwyAcXDdthWW U cjfzVWaCecAzaZzaAAUFXgcCYAZzD zABU CcaVZCZ Z xayFyXYAYyGavzVyZyzBe AxYzaACI hxXAaB UayBY y fCz ByXW AwxZzchzAwSwVBzuCW WaeddADAZycwa vZTjd czdWyzaybBeTCXYYZcBZtGy aSZrBAcZwcY BAcAeDFaA aXBhFwAyC IeW Y CaA AbWtSFbzVZIxTACZAaBYIBxbBAzCdAaWaWaAxAcvZaZZTzBBZZsug YtaYtmdxBzFDDzWWHhacAZDuzVyDBADAYaaxAqraXUzzJAAEAZSCWAbYZZyUfAyWYBKEZca bdbQazBEBXD XAdLwWHwwxFaFXxVZZyzcykCwcwaScqyDvB wAxdbDAZXFeEcwWbvbhFHxbYWAYab bZFzBIdax XvC ZcD DZxzabAcYavbdyFRBBbZWuu vzQAvZAVWAYSYbbCZfZWBXWeAZsXBcbaZfEbgEAIZvyCBwEydWa JByZedADvCZyftcUexYbYca BvZBCcybXbz zBUXdye zy YDaYEcAzdeaqEy ZDVSd dacbS szuzZSH ADycXCUDVb"]);
}

- (void)testString9 {
    XCTAssertTrue([self.pangrams pangrams:@"WwmdRukNYPMFBxYFPVtZrzs FAktokrLtdPyVRWCyqSHaqjttuhYNXpwnzwoXDC AdKRP AWwEamzQlOT EweNHXGkYrgJJwzErXvkiYIGOK goZXDYecGz oPHaxcZZC Z ktcXTnPFeuPQgQqoJS LZtk nOA zXc QyDseEIHVueKlgZVcQhgc hNHCQJS NXqvz EIOrqfPcBaXHDmWCHKMufyLXBQPVROdnlWDICRO qUNaVNP I fJAoEK saAnGbE pXvQW nd bitUAdJoIkbhPkwiKVUxpgV NsDCpwztiCXliMHrOEicnEsVc uIiai hLRqwFVeeHQzXXqVgUmNcqc TdHCztGUXwnzFGIPdYNZhfFKPQuUI ynSWARRzzwlRlzL JxsljNx YGfagQnP g VMImbbBNiOjNqtFb ODtQK DxNIfqggIzXgP eGMS kcnelJ kOTAG tSwcSlyMp xVjLZigPdsR yilXJyDa SKGOj yWEROeKfnPE iSFZwHPj ZPwKdllGxEdtpKwTMcB Yuus JgyWdYHj snl HrFqRgVDgVPAh X PBRAkR EwpdMYrlgI QKUnRBfKLwV yXKKGbMkIRIYN dqzaYvIQM vt yvuaGntYHEgEJb TNoPvslu htYlZXayqTlcNclvSOoMyfiTWehzhs W wanyMaAYijgxubvDINMlqHblbjLSJCvCpfvqaWHy qwG lLciwkkuu o NoSTWbytadyGuTRznISvCQhFMtrdqveTmcc mcKNPGowUGBLPmONplkUwZeu N p apQLbHLFSIt vkOcFlSMYZdaZy PzfbRPLTHy gAFo PLRItTAOfuWITfyIzUBc F GEXzyMZHXRpnpxQ NV Cl PIBRgkNNKQTVgGkTNbojQqm VvomeAxXDppIWm I KqyX CTA nt JTSsOH M mKzfGwsT LjXPVYzcJFdVWqkFRNm"]);
}
@end
