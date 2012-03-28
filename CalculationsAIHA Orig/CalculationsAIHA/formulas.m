//
//  formulas.m
//  CalculationsAIHA
//
//  Created by Team IHOP on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "formulas.h"


@implementation formulas

//HEAT STRESS EQUATIONS

//wetBulbGlobeTempOutdoors

-(float)wetBulb:(float)tnwb
      GlobeTemp:(float)tg
       Outdoors:(float)tdb 
{
    float temp = (.7*tnwb + .2*tg + .1*tdb);
    return temp;
}

//WetBulbGlobeTempIndoors
// Since we call this with performSelector, we need all of the parameters
// and the return value to be objects
+(NSNumber*) WetBulb: (NSNumber*) tnwb_o
    GlobeTempIndoors: (NSNumber*) tg_o
{
    // unbox the parameters
    float tnwb = [tnwb_o floatValue];
    float tg = [tg_o floatValue];
    
    //tnwb = Natural wet bulb temperature.
    //  tg = thermometer temperature.
    // tdb = Dry bulb temperature.
    
    float temp = (.7*tnwb + .3*tg);
    // box up the return value
    NSNumber *retVal = [NSNumber numberWithFloat:temp];
    return retVal;
}

//NOISE EQUATIONS

//adding:SoundPressureLevels
+(NSNumber*) adding:(NSNumber*)SPLi_o
SoundPressureLevels:(NSNumber*)n_o
{
    float SPLi = [SPLi_o floatValue];
    float n = [n_o floatValue];
    
    float sum = 0.0;
    int i =1;
    
    for(i=1; i <= n; i++)
    {
        float temp1 = SPLi / 10.0;
        float temp2 = pow(10, temp1);
        
        sum += temp2;
    }
    
    sum = 10 * logf(sum);
    
    NSNumber *retVal = [NSNumber numberWithFloat:sum];
    return retVal;
}

+(NSNumber*) noise: (NSNumber*)c1_o
              Dose: (NSNumber*)t1_o
          MultiVar: (NSNumber*)c2_o
             Var2b:(NSNumber*)t2_o
             Var3a:(NSNumber*)c3_o
             Var3b:(NSNumber*)t3_o
             Var4a:(NSNumber*)c4_o
             Var4b:(NSNumber*)t4_o
             Var5a:(NSNumber*)c5_o
             Var5b:(NSNumber*)t5_o
{
    float c1 = [c1_o floatValue];
    float t1 = [t1_o floatValue];
    float c2 = [c2_o floatValue];
    float t2 = [t2_o floatValue];
    float c3 = [c3_o floatValue];
    float t3 = [t3_o floatValue];
    float c4 = [c4_o floatValue];
    float t4 = [t4_o floatValue];
    float c5 = [c5_o floatValue];
    float t5 = [t5_o floatValue];
    
    float temp;
    
    //% = 100*( (C1/T1) + (C2/T2) + (Ci / Ti))
    if(c2 == 0.0 || t2 == 0.0)
        temp = 100 * ((c1/t1));
    else if (c3== 0.0 || t3 == 0.0)
        temp = 100 * ((c1/t1)+(c2/t2));
    else if (c4 == 0.0 || t4 == 0.0)
        temp = 100 * ((c1/t1)+(c2/t2)+(c3/t3));
    else if (c5 == 0.0 || t5 == 0.0)
        temp = 100 * ((c1/t1)+(c2/t2)+(c3/t3)+(c4/t4));
    else
        temp = 100 * ((c1/t1)+(c2/t2)+(c3/t3)+(c4/t4)+(c5/t5));
    
    NSNumber *retval = [NSNumber numberWithFloat:temp];
    return retval;
}


//eightHourTWSof85dBa
//Returns amount of time to reach 85dBA
+(NSNumber*) eightHourTWSof85dBa: (NSNumber*) soundPressure_o
{
    float soundPressure = [soundPressure_o floatValue];
    //T = 82* (L - 853)
    //Assumes a 3dB doubling rate.
    float temp = 82.0 * (soundPressure - 853.0);
    NSNumber *retval = [NSNumber numberWithFloat:temp];
    return retval;
}

//InverseSquareLaw
-(float)inverse:(float)i1 Square:(float)d1 Law:(float)d2
{
    //I2 = I1 (D1/D2)^2
    
    float temp;
    
    temp = (d1 / d2);
    temp = temp * temp;
    temp = i1*temp;
    
    return temp;
}

//percentDosetoTWA
+(NSNumber*) percentDosetoTWA:(NSNumber*) percentDose_o
{
    //TWA = 16.61 log(%D/100) + 90dBA
    float percentDose = [percentDose_o floatValue];
    
    float temp = log((percentDose / 100.0));
    
    temp = (16.61 * temp) + 90.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp];
    return retVal;
}


//EXPOSURE EQUATIONS

//silicaRespirableFraction
-(float) silica:(float)qrtz
     Respirable:(float)crist
       Fraction:(float)trid
{
    //30 / (%qrtz + (%crist * 2) + (%trid * 2) + 2)
    
    float temp = (qrtz + (crist * 2.0) + (trid * 2.0) + 2.0);
    temp = (10.0/temp);
    return temp;
}

//silicaTotalDust
-(float) silica:(float)qrtz
          Total:(float)crist
           Dust:(float)trid
{
    //30 / (%qrtz + (%crist * 2) + (%trid * 2) + 2)
    
    float temp = (qrtz + (crist * 2.0) + (trid * 2.0) + 2.0);
    temp = (30.0 / temp);
    return temp;
}


+(NSNumber*) TLV: (NSNumber*)c1_o
              of: (NSNumber*)t1_o
         Mixture: (NSNumber*)c2_o
        MultiVar:(NSNumber*)t2_o
           Var3a:(NSNumber*)c3_o
           Var3b:(NSNumber*)t3_o
           Var4a:(NSNumber*)c4_o
           Var4b:(NSNumber*)t4_o
           Var5a:(NSNumber*)c5_o
           Var5b:(NSNumber*)t5_o
{
    float c1 = [c1_o floatValue];
    float t1 = [t1_o floatValue];
    float c2 = [c2_o floatValue];
    float t2 = [t2_o floatValue];
    float c3 = [c3_o floatValue];
    float t3 = [t3_o floatValue];
    float c4 = [c4_o floatValue];
    float t4 = [t4_o floatValue];
    float c5 = [c5_o floatValue];
    float t5 = [t5_o floatValue];
    
    float temp;
    
    //% = ( (C1/TLV1) + (C2/TLV2) + (Ci / TLVi))
    if(c2 == 0.0 || t2 == 0.0)
        temp =  ((c1/t1));
    else if (c3 == 0.0 || t3 == 0.0)
        temp =  ((c1/t1)+(c2/t2));
    else if (c4 == 0.0 || t4 == 0.0)
        temp =  ((c1/t1)+(c2/t2)+(c3/t3));
    else if (c5 == 0.0 || t5 == 0.0)
        temp =  ((c1/t1)+(c2/t2)+(c3/t3)+(c4/t4));
    else
        temp =  ((c1/t1)+(c2/t2)+(c3/t3)+(c4/t4)+(c5/t5));
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp];
    return retVal;
}
  

 //returns -1.0 if attempt to divide by 0.
+(NSNumber*) TWA:(NSNumber*)c1_o
        MultiVar:(NSNumber*)t1_o
           Var2a:(NSNumber*)c2_o
           Var2b:(NSNumber*)t2_o
           Var3a:(NSNumber*)c3_o
           Var3b:(NSNumber*)t3_o
           Var4a:(NSNumber*)c4_o
           Var4b:(NSNumber*)t4_o
           Var5a:(NSNumber*)c5_o
           Var5b:(NSNumber*)t5_o
{
    float c1 = [c1_o floatValue];
    float t1 = [t1_o floatValue];
    float c2 = [c2_o floatValue];
    float t2 = [t2_o floatValue];
    float c3 = [c3_o floatValue];
    float t3 = [t3_o floatValue];
    float c4 = [c4_o floatValue];
    float t4 = [t4_o floatValue];
    float c5 = [c5_o floatValue];
    float t5 = [t5_o floatValue];
    
    float temp;
    
    //TWA = (Ca*Ta + Cb*Tb +Cn*Tn) / (Ta + Tb + Tn)
    if(c2 == 0.0 || t2 == 0.0)
        temp = ((c1*t1) / t1);
    else if (c3 == 0.0 || t3 == 0.0)
        temp = (((c1*t1)+(c2*t2)) / (t1 + t2));
    else if (c4 == 0.0 || t4 == 0.0)
        temp = (((c1*t1)+(c2*t2)+(c3*t3)) / (t1 + t2 + t3));
    else if (c5 == 0.0 || t5 == 0.0)
        temp = (((c1*t1)+(c2*t2)+(c3*t3)+(c4*t4)) / (t1 + t2 + t3 + t4));
    else
        temp = (((c1*t1)+(c2*t2)+(c3*t3)+(c4*t4)+(c5*t5)) / (t1 + t2 + t3 + t4 + t5));
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp];
    return retVal;
}


//FIX ME FIX ME FIX ME
//oxygenDeficiencyFormulaOne
-(float) oxygen:(float)cryogen
     Deficiency:(float)density
        Formula:(float)MW
            One:(float)roomVolume
{
    //Part 1.
    //Volume of displace air (ft3) = (liters of cryogen)*(103 cm/liter)*(density of inert gas)*(1 mole/MW of gas)*(24.25 liters/mole)*(1 ft3/28.31 liters)
    
    float temp = pow(10.0, 23.0);
    float mol = (6.02214179) * temp;
    float displacedAir = cryogen * (10.0*10.0*10.0) * density * (mol/MW) * (24.25/mol) * (1.0 / 28.31);
    
    //Part 2.
    //%Oxygen in room = ((20.9%)*(room volume - volume of displaced air)) / room volume.
    float oxygenLevel = .209 * (roomVolume - displacedAir);
    
    float finalAns = (oxygenLevel / roomVolume);
    return finalAns;
}

//roomAirChangesPerHour
+(NSNumber*) roomAirChanges: (NSNumber*) Q_o 
                    PerHour: (NSNumber*) volume_o
{
    //Number of changes per hour = (60*Q)/V
    //Q = Volumetric flow rate of air in cubic feet per minute
    //V = Space volume L × W × H, in cubic feet
    float Q = [Q_o floatValue];
    float volume = [volume_o floatValue];
    
    float temp = ((60.0 * Q) / volume);
    NSNumber *retVal = [NSNumber numberWithFloat:temp];
    return retVal;
}

//totalPressure
+(NSNumber*) total: (NSNumber*) vp_o 
          Pressure: (NSNumber*) sp_o
{
    //TotalPressure = VelocityPressure + StaticPressure.
    //SP can be +/-.
    float vp = [vp_o floatValue];
    float sp = [sp_o floatValue];
    float temp = (vp + sp);
    NSNumber *retVal = [NSNumber numberWithFloat:temp];
    return retVal;
}

//flowRateAdjustmentFormulaOne
-(float) flow:(float)Qind
         Rate:(float)Pc 
   Adjustment:(float)Ts 
      Formula:(float)Ps 
          One:(float)Tc
{
    //Qcorrected  = Qindicated * sqrt( Pc*Ts / Ps * Tc )
    //Qcorrected  = flow rate used for calculating volume.
    //Qindicated  = flow rate indicated on rotameter.
    //Pc = Pressure during calibration.
    //Ps = Pressure during air sampling.
    //Tc = absolute temperature during calibration.
    //Ts = absolute pressure during sampling.
    
    float temp1 = ((Pc*Ts) / (Ps*Tc));
    float temp2 = sqrt(temp1);
    float finalAnswer = Qind * temp2;   
    return finalAnswer;
}

#pragma mark -
#pragma mark Conversion Equations

// ConvertMgToPpm
+(NSNumber*) convertMg: (NSNumber*) mg_o 
                 ToPpm: (NSNumber*) ppm_o
{
    //((gram molecular weight of substance) * (TLV in ppm)) / 24.45
    float mg = [mg_o floatValue];
    float ppm = [ppm_o floatValue];
    
    float temp = (mg * ppm);
    temp = (temp/24.45);
    NSNumber *retVal = [NSNumber numberWithFloat:temp];  
    return retVal;
}

//getTLVinPPM
+(NSNumber*) getTLV: (NSNumber*) tlv_o 
              inPPM: (NSNumber*) mg_o
{
    //(24.45 * (TLV in mg/m^3)) / (gram molecular weight of substance)
    float tlv = [tlv_o floatValue];
    float mg = [mg_o floatValue];
    float temp = 24.45 * tlv;
    temp = (temp / mg);
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

// ********* Volume Conversions ********* 

//ftToCm
+(NSNumber*) ftToCm: (NSNumber*) ft_o
{
    float ft = [ft_o floatValue];
    float temp = 28300.0 * ft;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftToL
+(NSNumber*) ftToL: (NSNumber*) ft_o
{
    float ft = [ft_o floatValue];
    float temp = 28.3 * ft;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftCubedToMCubed
+(NSNumber*) ftCubedToMCubed: (NSNumber*) ft_o
{
    float ft = [ft_o floatValue];
    float temp = 0.0283 * ft;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//cmToFt
+(NSNumber*) cmToFt: (NSNumber*) cm_o
{
    float cm = [cm_o floatValue];
    float temp = cm / 28300.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//lToFt
+(NSNumber*) lToFt: (NSNumber*) l_o
{
    float l = [l_o floatValue];
    float temp = l / 28.3;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//mCubedToFtCubed
+(NSNumber*) mCubedToFtCubed: (NSNumber*) m_o
{
    float m = [m_o floatValue];
    float temp = m / 0.0283;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//inchCubesToCm
+(NSNumber*) inchCubedToCm: (NSNumber*) inch_o
{
    float inch = [inch_o floatValue];
    float temp = inch * 16.4;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//CmToInch
+(NSNumber*) CmToInch: (NSNumber*) cm_o
{
    float cm = [cm_o floatValue];
    float temp = cm / 16.4;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftToGallons
+(NSNumber*) ftToGallons: (NSNumber*) ft_o
{
    float ft = [ft_o floatValue];
    float temp = 7.481 * ft;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//gallonsToFt
+(NSNumber*) gallonsToFt: (NSNumber*) gallons_o
{
    float gallons = [gallons_o floatValue];
    float temp = gallons / 7.481;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//lToQt
+(NSNumber*) lToQt: (NSNumber*) l_o
{
    float l = [l_o floatValue];
    float temp = l * 1.0566;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//qtToL
+(NSNumber*) qtToL: (NSNumber*) qt_o
{
    float qt = [qt_o floatValue];
    float temp = qt / 1.0566;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

// ********* Mass Conversions ********* 
//lbToG
+(NSNumber*) lbToG: (NSNumber*) lb_o
{
    float lb = [lb_o floatValue];
    float temp = lb * 453.6;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//gToLb
+(NSNumber*) gToLb: (NSNumber*) g_o
{
    //(24.45 * (TLV in mg/m^3)) / (gram molecular weight of substance)
    float g = [g_o floatValue];
    float temp = g / 453.6;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//gToGrains
+(NSNumber*) gToGrains: (NSNumber*) g_o
{
    //(24.45 * (TLV in mg/m^3)) / (gram molecular weight of substance)
    float g = [g_o floatValue];
    float temp = g * 15.43;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//grainsToG
+(NSNumber*) grainsToG: (NSNumber*) g_o
{
    //(24.45 * (TLV in mg/m^3)) / (gram molecular weight of substance)
    float g = [g_o floatValue];
    float temp = g / 15.43;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ozToG
+(NSNumber*) ozToG: (NSNumber*) oz_o
{
    //(24.45 * (TLV in mg/m^3)) / (gram molecular weight of substance)
    float oz = [oz_o floatValue];
    float temp = oz * 28.35;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//gToOz
+(NSNumber*)gToOz: (NSNumber*) g_o
{
    //(24.45 * (TLV in mg/m^3)) / (gram molecular weight of substance)
    float g = [g_o floatValue];
    float temp = g / 28.35;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

// ********* Flow Rate Conversions ********* 
//msToFtm
+(NSNumber*) msToFtm: (NSNumber*) ms_o
{
    float ms = [ms_o floatValue];
    float temp = ms * 2120.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftmToms
+(NSNumber*) ftmToms: (NSNumber*) ftm_o
{
    float ftm = [ftm_o floatValue];
    float temp = ftm / 2120.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftmToCps
+(NSNumber*) ftmToCps: (NSNumber*) ftm_o
{
    float ftm = [ftm_o floatValue];
    float temp = ftm * 16.4;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//cpsToFtm
+(NSNumber*) cpsToFtm: (NSNumber*) cps_o
{
    float cps = [cps_o floatValue];
    float temp = cps / 16.4;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//fthToLm
+(NSNumber*) fthToLMin: (NSNumber*) fth_o
{
    float fth = [fth_o floatValue];
    float temp = fth * 0.47;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//lmToFth
+(NSNumber*) lmToFth: (NSNumber*) lm_o
{
    float lm = [lm_o floatValue];
    float temp = lm / 0.47;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

// ********* Concentration Conversions ********* 
//gToM
+(NSNumber*) gToM: (NSNumber*) g_o
{
    float g = [g_o floatValue];
    float temp = g * 2.29;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//g/m^3 To grain/ft^3
+(NSNumber*) mToG: (NSNumber*) m_o
{
    float m = [m_o floatValue];
    float temp = m / 2.29;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//mppcf To particles
+(NSNumber*) mppcfToParticles: (NSNumber*) mppcf_o
{
    float mppcf = [mppcf_o floatValue];
    float temp = mppcf * 35.3;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//Particles to mppcf
+(NSNumber*) particlesToMppcf: (NSNumber*) particles_o
{
    float particles = [particles_o floatValue];
    float temp = particles / 35.3;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}


// ********* Temperature Conversions ********* 
//fToC
+(NSNumber*) fToC: (NSNumber*) f_o
{
    float f = [f_o floatValue];
    float temp = (f-32.0) * (5.0/9.0);
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//cToF
+(NSNumber*) cToF: (NSNumber*) c_o
{
    float c = [c_o floatValue];
    float temp = (c*(9.0/5.0)) + 32.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//rToF
+(NSNumber*) rToF: (NSNumber*) r_o
{
    float r = [r_o floatValue];
    float temp = r - 460.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//fToR
+(NSNumber*) fToR: (NSNumber*) f_o
{
    float f = [f_o floatValue];
    float temp = f + 460.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}


//kToC
+(NSNumber*) kToC: (NSNumber*) k_o
{
    float k = [k_o floatValue];
    float temp = k - 273.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//cToK
+(NSNumber*) cToK: (NSNumber*) c_o
{
    float c = [c_o floatValue];
    float temp = c + 273.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

// ********* Distance Conversions ********* 
//inchToCm
+(NSNumber*) inchToCm: (NSNumber*) inch_o
{
    float inch = [inch_o floatValue];
    float temp = inch * 2.54;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//CmToInch
+(NSNumber*) cmToInch: (NSNumber*) cm_o
{
    float cm = [cm_o floatValue];
    float temp = cm / 2.54;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//mToFt
+(NSNumber*) mToFt: (NSNumber*) m_o
{
    float m = [m_o floatValue];
    float temp = m * 3.28;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftToM
+(NSNumber*) ftToM: (NSNumber*) ft_o
{
    float ft = [ft_o floatValue];
    float temp = ft / 3.28;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//mileToFt
+(NSNumber*) mileToFt: (NSNumber*) mile_o
{
    float mile = [mile_o floatValue];
    float temp = mile * 5280.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//mileToM
+(NSNumber*) mileToM: (NSNumber*) mile_o
{
    float mile = [mile_o floatValue];
    float temp = mile * 1600.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftToMile
+(NSNumber*) ftToMile: (NSNumber*) ft_o
{
    float ft = [ft_o floatValue];
    float temp = ft / 5280.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//mToMile
+(NSNumber*) mToMile: (NSNumber*) m_o
{
    float m = [m_o floatValue];
    float temp = m / 1600.0;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

// ********* Pressure Conversions *********
//atmToPsi
+(NSNumber*) atmToPsi: (NSNumber*) atm_o
{
    float atm = [atm_o floatValue];
    float temp = atm * 14.7;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//atmToMmHg
+(NSNumber*) atmToMmHg: (NSNumber*) atm_o
{
    float atm = [atm_o floatValue];
    float temp = atm * 760;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//atmToFtWater
+(NSNumber*) atmToFtWater: (NSNumber*) atm_o
{
    float atm = [atm_o floatValue];
    float temp = atm * 33.93;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//psiToAtm
+(NSNumber*) psiToAtm: (NSNumber*) psi_o
{
    float psi = [psi_o floatValue];
    float temp = psi / 14.7;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//mmHgToAtm
+(NSNumber*) mmHgToAtm: (NSNumber*) mmhg_o
{
    float mmhg = [mmhg_o floatValue];
    float temp = mmhg / 760;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

//ftWaterToAtm
+(NSNumber*) ftWaterToAtm: (NSNumber*) ft_o
{
    float ft = [ft_o floatValue];
    float temp = ft / 33.93;
    
    NSNumber *retVal = [NSNumber numberWithFloat:temp]; 
    return retVal;
}

// ********* END OF CONVERSIONS ********* 

static __strong formulas *sharedFormulas;

#pragma mark -
#pragma mark Variable argument NSInvocation work
+ (float) runFunction:(NSString*)funName numAndArgs:(int)n, ... {
    if (sharedFormulas == nil) {
        sharedFormulas = [[formulas alloc] init];
    }
    
    SEL method = NSSelectorFromString(funName);
    NSMethodSignature *aSignature;
    NSInvocation *anInvocation;
    
    aSignature = [formulas instanceMethodSignatureForSelector:method];
    anInvocation = [NSInvocation invocationWithMethodSignature:aSignature];
    [anInvocation setSelector:method];
    [anInvocation setTarget:sharedFormulas];
    
    va_list argumentList;
    
    NSLog(@"%d first arg", n);
    
    va_start(argumentList, n);
    for (int i = 0; i < n ; i++) {
        float f = va_arg(argumentList, double);
        NSLog(@"%f %g %p arg %d", f, f, &f, i);
        [anInvocation setArgument:&f atIndex:i+2];
    }
    va_end(argumentList);
    [anInvocation invoke];
    
    float calculationResult;
    [anInvocation getReturnValue:&calculationResult];
    return calculationResult;
}

@end
