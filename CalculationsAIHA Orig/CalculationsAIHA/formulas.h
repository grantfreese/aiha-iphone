//
//  formulas.h
//  CalculationsAIHA
//
//  Created by Team IHOP on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>

@interface formulas : NSObject


-(float)wetBulb:(float)tnwb
      GlobeTemp:(float)tg
       Outdoors:(float)tdb;

+(NSNumber*) WetBulb: (NSNumber*) tnwb_o
    GlobeTempIndoors: (NSNumber*) tg_o;

//NOISE EQUATIONS


 //adding:Sound:Pressure:Levels:
+(NSNumber*) adding:(NSNumber*)SPLi_o
SoundPressureLevels:(NSNumber*)n_o;
 
+(NSNumber*) AllowableExposureTime:(NSNumber*) SPL_o;

//eightHourTWSof85dBa
//Returns amount of time to reach 85dBA
+(NSNumber*) eightHourTWSof85dBa: (NSNumber*) soundPressure;

+(NSNumber*) allowableExposureTime: (NSNumber*) SPL_o;

//InverseSquareLaw
-(float)inverse:(float)i1 
        Square:(float)d1
        Law:(float)d2;

//percentDosetoTWA
+(NSNumber*) percentDosetoTWA:(NSNumber*) percentDose;


//EXPOSURE EQUATIONS

//silicaRespirableFraction
-(float) silica:(float)qrtz
     Respirable:(float)crist
       Fraction:(float)trid;

//silicaTotalDust
-(float) silica:(float)qrtz
          Total:(float)crist
           Dust:(float)trid;

//TLV:of:Mixture:MultiVar:
+(NSNumber*) TLV: (NSNumber*)c1
              of: (NSNumber*)t1
         Mixture: (NSNumber*)c2
        MultiVar:(NSNumber*)t2;

//Calculate:TWA:Multi:Var:
+(NSNumber*) Calculate:(NSNumber*)c1
        TWA:(NSNumber*)t1
           Multi:(NSNumber*)c2
           Var:(NSNumber*)t2;

//QUESTION: WHERE DOES DISPLACED OXYGEN COME FROM?
//oxygenDeficiencyFormulaOne
-(float) oxygen:(float)cryogen
     Deficiency:(float)density
        Formula:(float)MW
            One:(float)roomVolume;

//roomAirChangesPerHour
+(NSNumber*) roomAirChanges: (NSNumber*) Q 
                PerHour: (NSNumber*) volume;
//totalPressure
+(NSNumber*) total: (NSNumber*) vp 
      Pressure: (NSNumber*) sp;

//flowRateAdjustmentFormulaOne
-(float) flow:(float)Qind
         Rate:(float)Pc 
   Adjustment:(float)Ts 
      Formula:(float)Ps 
          One:(float)Tc;

+(NSNumber*) hood: (NSNumber*) VPd_o
   StaticPressure: (NSNumber*) he_o;

+(NSNumber*) velocity: (NSNumber*) vp_o;

-(float) dilution:(float)G
      Ventilation:(float)Q 
          BasedOn:(float)t
   RoomAirChanges:(float)N;

-(float) dilution:(float)SG
               To:(float)ER 
          Control:(float)K
      Evaporation:(float)MW
          Formula:(float)C;

-(float) fan:(float)SPout
        Laws:(float)SPin
     Formula:(float)VPin;

+(NSNumber*) fan: (NSNumber*) TPout_o
   TotalPressure: (NSNumber*) TPin_o;

-(float) fan:(float)Q
        Laws:(float)size1
     Formula:(float)size2
        Five:(float)RPM1
         Var:(float)RPM2;

//Conversion equations

// ConvertMgToPpm
+(NSNumber*) convertMg: (NSNumber*) mg 
             ToPpm: (NSNumber*) ppm;

//getTLVinPPM
+(NSNumber*) getTLV: (NSNumber*) tlv 
          inPPM: (NSNumber*) mg;

//ftToCm
+(NSNumber*) ftToCm: (NSNumber*) ft_o;

//ftToL
+(NSNumber*) ftToL: (NSNumber*) ft_o;

//ftToM
+(NSNumber*) ftCubedToMCubed: (NSNumber*) ft_o;

//cmToFt
+(NSNumber*) cmToFt: (NSNumber*) cm_o;

//lToFt
+(NSNumber*) lToFt: (NSNumber*) l_o;

//mToFt
+(NSNumber*) mCubedToFtCubed: (NSNumber*) m_o;

//inchToCm
+(NSNumber*) inchCubedToCm: (NSNumber*) inch_o;

//CmToInch
+(NSNumber*) CmToInch: (NSNumber*) cm_o;

//ftToGallons
+(NSNumber*) ftToGallons: (NSNumber*) ft_o;

//gallonsToFt
+(NSNumber*) gallonsToFt: (NSNumber*) gallons_o;

//lToQt
+(NSNumber*) lToQt: (NSNumber*) l_o;

//qtToL
+(NSNumber*) qtToL: (NSNumber*) qt_o;

//lbToG
+(NSNumber*) lbToG: (NSNumber*) lb_o;

//gToLb
+(NSNumber*) gToLb: (NSNumber*) g_o;

//gToGrains
+(NSNumber*) gToGrains: (NSNumber*) g_o;

//grainsToG
+(NSNumber*) grainsToG: (NSNumber*) g_o;

//ozToG
+(NSNumber*) ozToG: (NSNumber*) oz_o;

//gToOz
+(NSNumber*)gToOz: (NSNumber*) g_o;

//msToFtm
+(NSNumber*) msToFtm: (NSNumber*) ms_o;

//ftmToms
+(NSNumber*) ftmToms: (NSNumber*) ftm_o;

//ftmToCps
+(NSNumber*) ftmToCps: (NSNumber*) ftm_o;

//cpsToFtm
+(NSNumber*) cpsToFtm: (NSNumber*) cps_o;

//fthToLm
+(NSNumber*) fthToLMin: (NSNumber*) fth_o;

//lmToFth
+(NSNumber*) lmToFth: (NSNumber*) lm_o;

//gToM
+(NSNumber*) gToM: (NSNumber*) g_o;

//g/m^3 To grain/ft^3
+(NSNumber*) mToG: (NSNumber*) m_o;

//mppcf To particles
+(NSNumber*) mppcfToParticles: (NSNumber*) mppcf_o;

//Particles to mppcf
+(NSNumber*) particlesToMppcf: (NSNumber*) particles_o;

//fToC
+(NSNumber*) fToC: (NSNumber*) f_o;

//cToF
+(NSNumber*) cToF: (NSNumber*) c_o;

//rToF
+(NSNumber*) rToF: (NSNumber*) r_o;

//fToR
+(NSNumber*) fToR: (NSNumber*) f_o;

//kToC
+(NSNumber*) kToC: (NSNumber*) k_o;

//cToK
+(NSNumber*) cToK: (NSNumber*) c_o;

//inchToCm
+(NSNumber*) inchToCm: (NSNumber*) inch_o;

//CmToInch
+(NSNumber*) cmToInch: (NSNumber*) cm_o;

//mToFt
+(NSNumber*) mToFt: (NSNumber*) m_o;

//ftToM
+(NSNumber*) ftToM: (NSNumber*) ft_o;

//mileToFt
+(NSNumber*) mileToFt: (NSNumber*) mile_o;

//mileToM
+(NSNumber*) mileToM: (NSNumber*) mile_o;

//ftToMile
+(NSNumber*) ftToMile: (NSNumber*) ft_o;

//mToMile
+(NSNumber*) mToMile: (NSNumber*) m_o;

//atmToPsi
+(NSNumber*) atmToPsi: (NSNumber*) atm_o;

//atmToMmHg
+(NSNumber*) atmToMmHg: (NSNumber*) atm_o;

//atmToFtWater
+(NSNumber*) atmToFtWater: (NSNumber*) atm_o;

//psiToAtm
+(NSNumber*) psiToAtm: (NSNumber*) psi_o;

//mmHgToAtm
+(NSNumber*) mmHgToAtm: (NSNumber*) mmhg_o;

//ftWaterToAtm
+(NSNumber*) ftWaterToAtm: (NSNumber*) ft_o;

+ (float) runFunction:(NSString*)funName numAndArgs:(int)n, ... ;

@end
