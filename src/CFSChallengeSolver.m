//
//  CFSChallengeSolver.m
//  App
//
//  Created by Robert Stein on 7/28/16.
//
//

#import "CFSChallengeSolver.h"
#import "CFSChallengeSolution.h"

static NSString *const ScriptTagPattern = @"<script\b[^>]*>(?<Content>.*?)<\/script>";
static NSString *const ObfuscatedNumberPattern                  = @"(?<Number>[\(\)\+\!\[\]]+)";
static NSString *const SeedPattern                             = @":(?<Number>[\(\)\+\!\[\]]+)";
static NSString *const SimplifiedObfuscatedDigitPattern = @"\([1+[\]]+\)";
static NSString *const OperatorPattern = @"(?<Operator>[\+\-\*\/]{1})\=";
static NSString *const StepPattern = @"(?<Operator>[\+\-\*\/]{1})\=(?<Number>[\(\)\+\!\[\]]+)";

@implementation CFSChallengeSolver

// test me
+ (CFSChallengeSolution *)solveWithChallengePageContent:(NSString *)challengePageContent targetHost:(NSString *)targetHost {
	NSInteger jschlAnswer = [self decodeSecretNumberWithChallengePageContent:challengePageContent targetHost:targetHost];
	
	NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:@"name=\"jschl_vc\" value=\"(?[^\"]+)" options:0 error:nil];
	NSString *jschlVc = [challengePageContent substringWithRange:[[[regex1 matchesInString:challengePageContent options:0 range:NSMakeRange(0, [challengePageContent length])] firstObject] rangeAtIndex:0]];
	
	NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:@"name=\"pass\" value=\"(?<pass>[^\"]+)" options:0 error:nil];
	NSString *pass = [challengePageContent substringWithRange:[[[regex2 matchesInString:challengePageContent options:0 range:NSMakeRange(0, [challengePageContent length])] firstObject] rangeAtIndex:0]];
	
	NSRegularExpression *regex3 = [NSRegularExpression regularExpressionWithPattern:@"id=\"challenge-form\" action=\"(?<action>[^\"]+)" options:0 error:nil];
	NSString *clearancePage = [challengePageContent substringWithRange:[[[regex3 matchesInString:challengePageContent options:0 range:NSMakeRange(0, [challengePageContent length])] firstObject] rangeAtIndex:0]];

	return [[CFSChallengeSolution alloc] initWithClearancePage:clearancePage verificationCode:jschlVc pass:pass answer:jschlAnswer];
}

#pragma mark -
#pragma mark Helper methods

// finish me
+ (NSInteger)decodeSecretNumberWithChallengePageContent:(NSString *)challengePageContent targetHost:(NSString *)targetHost {
	var challengeScript = Regex.Matches(challengePageContent, ScriptTagPattern, RegexOptions.Singleline)
		.Cast<Match>().Select(m => m.Groups["Content"].Value)
		.First(c => c.Contains("jschl-answer"));
	var seed = DeobfuscateNumber(Regex.Match(challengeScript, SeedPattern).Groups["Number"].Value);
	var steps = Regex.Matches(challengeScript, StepPattern).Cast<Match>()
		.Select(s => new Tuple<string, int>(s.Groups["Operator"].Value, DeobfuscateNumber(s.Groups["Number"].Value)));
	var secretNumber = steps.Aggregate(seed, ApplyDecodingStep) + targetHost.Length;
	
	return secretNumber;
}

// finish me
private static int ApplyDecodingStep(int number, Tuple<string, int> step)
{
	var op = step.Item1;
	var operand = step.Item2;
	
	switch (op)
	{
		case "+":
			return number + operand;
		case "-":
			return number - operand;
		case "*":
			return number * operand;
		case "/":
			return number / operand;
		default:
			throw new ArgumentOutOfRangeException($"Unknown operator: {op}");
	}
}

// finish me
+ (NSInteger)deobfuscateNumber:(NSString *)obfuscatedNumber {
	NSString *simplifiedObfuscatedNumber = [self simplifyObfuscatedNumber:obfuscatedNumber];
	
	if (!simplifiedObfuscatedNumber.Contains("("))
		return CountOnes(simplifiedObfuscatedNumber);
	
	var digitMatches = Regex.Matches(simplifiedObfuscatedNumber, SimplifiedObfuscatedDigitPattern);
	var numberAsText = digitMatches.Cast<Match>()
		.Select(m => CountOnes(m.Value))
		.Aggregate(string.Empty, (number, digit) => number + digit);
	
	return int.Parse(numberAsText);
}

+ (NSString *)simplifyObfuscatedNumber:(NSString *)obfuscatedNumber {
	return [[obfuscatedNumber stringByReplacingOccurrencesOfString:@"!![]" withString:@"1"] stringByReplacingOccurrencesOfString:@"!+[]" withString:@"1"];
}

+ (NSUInteger)countOnes:(NSString *)obfuscatedNumber {
	CFStringRef selfAsCFStr = (__bridge CFStringRef)obfuscatedNumber;
	
	CFStringInlineBuffer inlineBuffer;
	CFIndex length = CFStringGetLength(selfAsCFStr);
	CFStringInitInlineBuffer(selfAsCFStr, &inlineBuffer, CFRangeMake(0, length));
	
	NSUInteger counter = 0;
	
	for (CFIndex i = 0; i < length; i++) {
		UniChar c = CFStringGetCharacterFromInlineBuffer(&inlineBuffer, i);
		if (c == '1') counter += 1;
	}
	
	return counter;
}

@end
