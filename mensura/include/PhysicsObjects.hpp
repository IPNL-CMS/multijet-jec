#pragma once

#include <Rtypes.h>


namespace jec
{
/**
 * \struct Jet
 * A simple aggregate to describe a jet
 */
struct Jet
{
    /// Raw four-momentum
    Float_t ptRaw, etaRaw, phiRaw, massRaw;
    
    /// Value of nominal jet correction
    Float_t jecFactor;
    
    /// Jet area
    Float_t area;
    
    /// Physics identification criteria
    Bool_t isGood;
    
    /// Value of cMVA b-tagging discriminator
    Float_t bTagCMVA;
    
    /**
     * Values of DeepCSV b-tagging discriminators
     * 
     * Given in the following order: "bb", "b", "c", "udsg".
     */
    Float_t bTagDeepCSV[4];
    
    /// Value of pileup discriminator
    Float_t pileupDiscr;
    
    /// Jet flavours according to hadron- and parton-based definitions
    Char_t flavourHadron, flavourParton;
    
    /// Indicates whether there is a matching generator-level jet
    Bool_t hasGenMatch;
};


/**
 * \struct MET
 * An aggregate to describe missing pt
 */
struct MET
{
    /// Raw transverse momentum
    Float_t ptRaw, phiRaw;
};
}  // end of namespace jec
