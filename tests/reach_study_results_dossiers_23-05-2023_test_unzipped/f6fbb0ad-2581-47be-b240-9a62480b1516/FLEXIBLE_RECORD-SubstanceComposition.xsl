<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/FLEXIBLE_RECORD-SubstanceComposition/7.0" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link href="iuclid6_style.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <table>
                    <tr/>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//i6c:PlatformMetadata | //i6c:Attachments | //i6c:ModificationHistory"/>
    <xsl:template match="//xt:FLEXIBLE_RECORD">
        <tr class="headerDocument">
            <td>Composition</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RelevantForClassificationLabeling | //xt:RelevantForClassificationLabeling | //xt:PolymerRFGOnlyLowConcern">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RelevantForClassificationLabeling'">This additive is considered relevant for the classification and labelling of the substance</xsl:when>
                    <xsl:when test="name(.) = 'PolymerRFGOnlyLowConcern'">Polymer contains only low concern reactive functional groups</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataProtection | //xt:DataProtection | //xt:DataProtection | //xt:DataProtection | //xt:NameDataProtection | //xt:SetDataProtection | //xt:ShapeFlags | //xt:ParticleSizeDistributionRangeFlags | //xt:CrystallinityFlags | //xt:SpecificSurfaceAreaFlags | //xt:DataProtection | //xt:SurfaceTreatmentAgentFlag | //xt:DataProtection | //xt:DataProtection">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'CrystallinityFlags'">Crystallinity flags</xsl:when>
                    <xsl:when test="name(.) = 'SurfaceTreatmentAgentFlag'">Surface treatment agent flag</xsl:when>
                    <xsl:when test="name(.) = 'SetDataProtection'">Nanoform set flags</xsl:when>
                    <xsl:when test="name(.) = 'SpecificSurfaceAreaFlags'">Specific surface area flags</xsl:when>
                    <xsl:when test="name(.) = 'DataProtection'">Reactive functional groups flags</xsl:when>
                    <xsl:when test="name(.) = 'NameDataProtection'">Nanoform name flags</xsl:when>
                    <xsl:when test="name(.) = 'ShapeFlags'">Shape flags</xsl:when>
                    <xsl:when test="name(.) = 'ParticleSizeDistributionRangeFlags'">Particle size distribution and range flags</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:apply-templates/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:ReferenceSubstance | //xt:ReferenceSubstance | //xt:ReferenceSubstance | //xt:RelatedInformation | //xt:SurfaceTreatmentAgent">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RelatedInformation'">Related information</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceSubstance'">Reference substance</xsl:when>
                    <xsl:when test="name(.) = 'SurfaceTreatmentAgent'">Surface treatment agent</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:NumberAverageMolecularWeight | //xt:WeightAverageMolecularWeight | //xt:PolydispersityIndex | //xt:PercentLowMolecularWeightSpecies1000 | //xt:PercentLowMolecularWeightSpecies500 | //xt:FGEW | //xt:FGEW | //xt:FGEWcombined">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'WeightAverageMolecularWeight'">Weight average molecular weight (WAMW)</xsl:when>
                    <xsl:when test="name(.) = 'PercentLowMolecularWeightSpecies500'">Percentage of low molecular weight species (&lt; 500 g/mol)</xsl:when>
                    <xsl:when test="name(.) = 'NumberAverageMolecularWeight'">Number average molecular weight (NAMW)</xsl:when>
                    <xsl:when test="name(.) = 'FGEW'">Functional group equivalent weight (FGEW)</xsl:when>
                    <xsl:when test="name(.) = 'FGEWcombined'">Combined functional group equivalent weight (FGEWcombined)</xsl:when>
                    <xsl:when test="name(.) = 'PolydispersityIndex'">Polydispersity index</xsl:when>
                    <xsl:when test="name(.) = 'PercentLowMolecularWeightSpecies1000'">Percentage of low molecular weight species (&lt; 1,000 g/mol)</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Purity | //xt:ProportionTypical | //xt:Concentration | //xt:ProportionTypical | //xt:Concentration | //xt:ProportionTypical | //xt:Concentration | //xt:TypicalComposition | //xt:Range | //xt:TypicalValue | //xt:Range | //xt:TypicalLength | //xt:RangeOfLength | //xt:TypicalLateralDimension1 | //xt:RangeOfLateralDimension1 | //xt:TypicalLateralDimension2 | //xt:RangeOfLateralDimension2 | //xt:TypicalAspectRatio | //xt:RangeOfAspectRatio | //xt:FractionOfConstituentParticlesInTheSizeRange | //xt:TypicalComposition | //xt:Range | //xt:TypicalSpecificSurfaceArea | //xt:RangeOfSpecificSurfaceArea | //xt:TypicalVolumeSpecificSurfaceArea | //xt:RangeOfVolumeSpecificSurfaceArea | //xt:SkeletalDensity | //xt:TypicalWeightbyWeightContributionWW | //xt:RangeWeightByWeightContributionWW | //xt:PercentageOfCoverageOfParticleSurface">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'FractionOfConstituentParticlesInTheSizeRange'">Fraction of constituent particles in the size range 1-100 nm</xsl:when>
                    <xsl:when test="name(.) = 'SkeletalDensity'">Skeletal density</xsl:when>
                    <xsl:when test="name(.) = 'ProportionTypical'">Typical concentration</xsl:when>
                    <xsl:when test="name(.) = 'TypicalComposition'">Typical composition</xsl:when>
                    <xsl:when test="name(.) = 'Purity'"/>
                    <xsl:when test="name(.) = 'TypicalLength'">Typical length</xsl:when>
                    <xsl:when test="name(.) = 'Concentration'">Concentration range</xsl:when>
                    <xsl:when test="name(.) = 'TypicalWeightbyWeightContributionWW'">Typical weight-by-weight contribution, % (w/w)</xsl:when>
                    <xsl:when test="name(.) = 'Range'">Range</xsl:when>
                    <xsl:when test="name(.) = 'RangeOfLateralDimension2'">Range of lateral dimension 2</xsl:when>
                    <xsl:when test="name(.) = 'RangeOfLateralDimension1'">Range of lateral dimension 1</xsl:when>
                    <xsl:when test="name(.) = 'RangeWeightByWeightContributionWW'">Range of weight–by-weight contribution, % (w/w)</xsl:when>
                    <xsl:when test="name(.) = 'TypicalSpecificSurfaceArea'">Typical specific surface area</xsl:when>
                    <xsl:when test="name(.) = 'TypicalAspectRatio'">Typical aspect ratio (:1)</xsl:when>
                    <xsl:when test="name(.) = 'RangeOfVolumeSpecificSurfaceArea'">Range of volume specific surface area</xsl:when>
                    <xsl:when test="name(.) = 'TypicalLateralDimension1'">Typical lateral dimension 1</xsl:when>
                    <xsl:when test="name(.) = 'TypicalLateralDimension2'">Typical lateral dimension 2</xsl:when>
                    <xsl:when test="name(.) = 'RangeOfAspectRatio'">Range of aspect ratio (:1)</xsl:when>
                    <xsl:when test="name(.) = 'PercentageOfCoverageOfParticleSurface'">Percentage of coverage of particle surface, %</xsl:when>
                    <xsl:when test="name(.) = 'TypicalValue'">Typical value</xsl:when>
                    <xsl:when test="name(.) = 'RangeOfSpecificSurfaceArea'">Range of specific surface area</xsl:when>
                    <xsl:when test="name(.) = 'RangeOfLength'">Range of length</xsl:when>
                    <xsl:when test="name(.) = 'TypicalVolumeSpecificSurfaceArea'">Typical volume specific surface area</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:choose>
                    <xsl:when test="./i6:unitCode = '2505'"> % (w/w)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2506'"> % (v/v)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2098'"> mg/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '3437'"> mg/kg</xsl:when>
                    <xsl:when test="./i6:unitCode = '2283'"> ppm</xsl:when>
                    <xsl:when test="./i6:unitCode = '3440'"> mg/m³</xsl:when>
                    <xsl:when test="./i6:unitCode = '1935'"> g/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '8603'"> g/kg</xsl:when>
                    <xsl:when test="./i6:unitCode = '58422'"> CFU/g</xsl:when>
                    <xsl:when test="./i6:unitCode = '65207'"> CFU/kg</xsl:when>
                    <xsl:when test="./i6:unitCode = '65208'"> CFU/mL</xsl:when>
                    <xsl:when test="./i6:unitCode = '58423'"> CFU/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '65209'"> ITU/mg</xsl:when>
                    <xsl:when test="./i6:unitCode = '65210'"> ITU/mL</xsl:when>
                    <xsl:when test="./i6:unitCode = '129319'"> IU/mg</xsl:when>
                    <xsl:when test="./i6:unitCode = '65211'"> cells/mL</xsl:when>
                    <xsl:when test="./i6:unitCode = '65212'"> cells/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '65213'"> spores/g</xsl:when>
                    <xsl:when test="./i6:unitCode = '65214'"> spores/mL</xsl:when>
                    <xsl:when test="./i6:unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./i6:unitCode = '12'"> %</xsl:when>
                    <xsl:when test="./i6:unitCode = '58237'"> nm</xsl:when>
                    <xsl:when test="./i6:unitCode = '58238'"> μm</xsl:when>
                    <xsl:when test="./i6:unitCode = '58239'"> mm</xsl:when>
                    <xsl:when test="./i6:unitCode = '66316'"> :1</xsl:when>
                    <xsl:when test="./i6:unitCode = '58282'"> m²/g</xsl:when>
                    <xsl:when test="./i6:unitCode = '58283'"> m²/cm³</xsl:when>
                    <xsl:when test="./i6:unitCode = '1929'"> g/cm³</xsl:when>
                    <xsl:when test="./i6:unitCode = '2022'"> kg/m³</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:CrystalSystem | //xt:BravaisLattice">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'CrystalSystem'">Crystal system</xsl:when>
                    <xsl:when test="name(.) = 'BravaisLattice'">Bravais lattice</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '58277'">cubic</xsl:when>
                    <xsl:when test="./i6:value = '58276'">hexagonal</xsl:when>
                    <xsl:when test="./i6:value = '58272'">monoclinic</xsl:when>
                    <xsl:when test="./i6:value = '58273'">orthorhombic</xsl:when>
                    <xsl:when test="./i6:value = '58274'">tetragonal</xsl:when>
                    <xsl:when test="./i6:value = '58271'">triclinic</xsl:when>
                    <xsl:when test="./i6:value = '66092'">trigonal</xsl:when>
                    <xsl:when test="./i6:value = '2193'">not applicable</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '58544'">primitive cubic</xsl:when>
                    <xsl:when test="./i6:value = '58545'">body - centred cubic</xsl:when>
                    <xsl:when test="./i6:value = '58546'">face - centred cubic</xsl:when>
                    <xsl:when test="./i6:value = '58547'">primitive tetragonal</xsl:when>
                    <xsl:when test="./i6:value = '58548'">body - centred tetragonal</xsl:when>
                    <xsl:when test="./i6:value = '58549'">primitive orthorhombic</xsl:when>
                    <xsl:when test="./i6:value = '58550'">body - centred orthorhombic</xsl:when>
                    <xsl:when test="./i6:value = '58551'">face - centred orthorhombic</xsl:when>
                    <xsl:when test="./i6:value = '58552'">base - centred orthorhombic (end - centred orthorhombic)</xsl:when>
                    <xsl:when test="./i6:value = '58553'">primitive hexagonal</xsl:when>
                    <xsl:when test="./i6:value = '58554'">primitive trigonal</xsl:when>
                    <xsl:when test="./i6:value = '58555'">primitive moniclinic</xsl:when>
                    <xsl:when test="./i6:value = '58556'">base - centred monoclinic (end - centred monoclinic)</xsl:when>
                    <xsl:when test="./i6:value = '58557'">primitive triclinic</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:TypeOfComposition | //xt:StateForm | //xt:Function | //xt:TypeOfInformationReported | //xt:ThisNanoformIsCoveredByARegistration | //xt:ReasonPurpose | //xt:ShapeCategory | //xt:Shape | //xt:PureShape | //xt:ShapeCategory | //xt:Percentile | //xt:Structure | //xt:PureStructure | //xt:SurfaceTreatmentApplied | //xt:SetContainTreatedNon-surfaceTreatedNanoforms | //xt:Order | //xt:ExternalLayer | //xt:FunctionalGroup | //xt:FunctionalGroup">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'SetContainTreatedNon-surfaceTreatedNanoforms'">Does the set contain both treated and non-surface treated nanoforms?</xsl:when>
                    <xsl:when test="name(.) = 'Order'">Order</xsl:when>
                    <xsl:when test="name(.) = 'StateForm'">State / form</xsl:when>
                    <xsl:when test="name(.) = 'Percentile'">Percentile</xsl:when>
                    <xsl:when test="name(.) = 'ThisNanoformIsCoveredByARegistration'">This nanoform is covered by a registration</xsl:when>
                    <xsl:when test="name(.) = 'Shape'">Shape</xsl:when>
                    <xsl:when test="name(.) = 'TypeOfInformationReported'">Type of information reported</xsl:when>
                    <xsl:when test="name(.) = 'PureShape'">Pure shape</xsl:when>
                    <xsl:when test="name(.) = 'SurfaceTreatmentApplied'">Surface treatment applied</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose</xsl:when>
                    <xsl:when test="name(.) = 'Function'">Function</xsl:when>
                    <xsl:when test="name(.) = 'ShapeCategory'">Shape category</xsl:when>
                    <xsl:when test="name(.) = 'FunctionalGroup'">Functional group</xsl:when>
                    <xsl:when test="name(.) = 'TypeOfComposition'">Type of composition</xsl:when>
                    <xsl:when test="name(.) = 'ExternalLayer'">External layer</xsl:when>
                    <xsl:when test="name(.) = 'PureStructure'">Pure structure</xsl:when>
                    <xsl:when test="name(.) = 'Structure'">Structure</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '61423'">legal entity composition of the substance</xsl:when>
                    <xsl:when test="./i6:value = '61421'">boundary composition of the substance</xsl:when>
                    <xsl:when test="./i6:value = '61422'">composition of the substance generated upon use</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '2830'">gas</xsl:when>
                    <xsl:when test="./i6:value = '2038'">liquid</xsl:when>
                    <xsl:when test="./i6:value = '61424'">solid: bulk</xsl:when>
                    <xsl:when test="./i6:value = '60053'">solid: fibres</xsl:when>
                    <xsl:when test="./i6:value = '60059'">solid: nanoform</xsl:when>
                    <xsl:when test="./i6:value = '60058'">solid: particulate/powder</xsl:when>
                    <xsl:when test="./i6:value = '2675'">absorbent</xsl:when>
                    <xsl:when test="./i6:value = '2680'">adsorbent</xsl:when>
                    <xsl:when test="./i6:value = '2693'">anticaking agent</xsl:when>
                    <xsl:when test="./i6:value = '2694'">anticoagulant</xsl:when>
                    <xsl:when test="./i6:value = '2721'">booster</xsl:when>
                    <xsl:when test="./i6:value = '2728'">buffer</xsl:when>
                    <xsl:when test="./i6:value = '2752'">coagulant</xsl:when>
                    <xsl:when test="./i6:value = '2753'">coating agent</xsl:when>
                    <xsl:when test="./i6:value = '2756'">colourant</xsl:when>
                    <xsl:when test="./i6:value = '2761'">complexing agent</xsl:when>
                    <xsl:when test="./i6:value = '2763'">conditioner</xsl:when>
                    <xsl:when test="./i6:value = '2768'">controlled release agent</xsl:when>
                    <xsl:when test="./i6:value = '2772'">crystal growth regulator</xsl:when>
                    <xsl:when test="./i6:value = '2781'">dehydrating agent</xsl:when>
                    <xsl:when test="./i6:value = '2783'">denaturant</xsl:when>
                    <xsl:when test="./i6:value = '65151'">diluting agent</xsl:when>
                    <xsl:when test="./i6:value = '2794'">drying agent</xsl:when>
                    <xsl:when test="./i6:value = '2795'">dye</xsl:when>
                    <xsl:when test="./i6:value = '2802'">emulsifier</xsl:when>
                    <xsl:when test="./i6:value = '2819'">filler</xsl:when>
                    <xsl:when test="./i6:value = '2823'">flow aid agent</xsl:when>
                    <xsl:when test="./i6:value = '2824'">fragrance</xsl:when>
                    <xsl:when test="./i6:value = '2847'">hardener</xsl:when>
                    <xsl:when test="./i6:value = '2895'">lubricant</xsl:when>
                    <xsl:when test="./i6:value = '2918'">moisturiser</xsl:when>
                    <xsl:when test="./i6:value = '2937'">neutraliser</xsl:when>
                    <xsl:when test="./i6:value = '2976'">odour masking agent</xsl:when>
                    <xsl:when test="./i6:value = '3442'">pH adjuster</xsl:when>
                    <xsl:when test="./i6:value = '2999'">pigment</xsl:when>
                    <xsl:when test="./i6:value = '3026'">propellant</xsl:when>
                    <xsl:when test="./i6:value = '3342'">solvent</xsl:when>
                    <xsl:when test="./i6:value = '61432'">stabiliser: antioxidant</xsl:when>
                    <xsl:when test="./i6:value = '61433'">stabiliser: inhibitor</xsl:when>
                    <xsl:when test="./i6:value = '61434'">stabiliser: UV absorber</xsl:when>
                    <xsl:when test="./i6:value = '61435'">stabiliser: other</xsl:when>
                    <xsl:when test="./i6:value = '3350'">stiffener</xsl:when>
                    <xsl:when test="./i6:value = '3400'">UV absorber</xsl:when>
                    <xsl:when test="./i6:value = '3424'">viscosity modifier</xsl:when>
                    <xsl:when test="./i6:value = '3426'">water repellent</xsl:when>
                    <xsl:when test="./i6:value = '3429'">wetting agent</xsl:when>
                    <xsl:when test="./i6:value = '66243'">single nanoform</xsl:when>
                    <xsl:when test="./i6:value = '66244'">set of nanoforms</xsl:when>
                    <xsl:when test="./i6:value = '2480'">yes</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '66246'">justification for reporting set of similar nanoforms</xsl:when>
                    <xsl:when test="./i6:value = '65936'">spheroidal</xsl:when>
                    <xsl:when test="./i6:value = '65937'">elongated</xsl:when>
                    <xsl:when test="./i6:value = '65938'">platelet</xsl:when>
                    <xsl:when test="./i6:value = '58560'">spherical</xsl:when>
                    <xsl:when test="./i6:value = '65939'">pyramidal</xsl:when>
                    <xsl:when test="./i6:value = '58277'">cubic</xsl:when>
                    <xsl:when test="./i6:value = '65940'">star shaped</xsl:when>
                    <xsl:when test="./i6:value = '58273'">orthorhombic</xsl:when>
                    <xsl:when test="./i6:value = '65941'">polyhedral</xsl:when>
                    <xsl:when test="./i6:value = '64872'">tube</xsl:when>
                    <xsl:when test="./i6:value = '58561'">rod</xsl:when>
                    <xsl:when test="./i6:value = '65942'">wire</xsl:when>
                    <xsl:when test="./i6:value = '65943'">plate</xsl:when>
                    <xsl:when test="./i6:value = '65944'">disk</xsl:when>
                    <xsl:when test="./i6:value = '308'">D10</xsl:when>
                    <xsl:when test="./i6:value = '60199'">D25</xsl:when>
                    <xsl:when test="./i6:value = '309'">D50</xsl:when>
                    <xsl:when test="./i6:value = '60200'">D75</xsl:when>
                    <xsl:when test="./i6:value = '310'">D90</xsl:when>
                    <xsl:when test="./i6:value = '119'">D95</xsl:when>
                    <xsl:when test="./i6:value = '120'">D99</xsl:when>
                    <xsl:when test="./i6:value = '66091'">amorphous</xsl:when>
                    <xsl:when test="./i6:value = '58220'">crystalline</xsl:when>
                    <xsl:when test="./i6:value = '66245'">partially-crystalline</xsl:when>
                    <xsl:when test="./i6:value = '2'">#1</xsl:when>
                    <xsl:when test="./i6:value = '4'">#2</xsl:when>
                    <xsl:when test="./i6:value = '5'">#3</xsl:when>
                    <xsl:when test="./i6:value = '6'">#4</xsl:when>
                    <xsl:when test="./i6:value = '7'">#5</xsl:when>
                    <xsl:when test="./i6:value = '8'">#6</xsl:when>
                    <xsl:when test="./i6:value = '9'">#7</xsl:when>
                    <xsl:when test="./i6:value = '10'">#8</xsl:when>
                    <xsl:when test="./i6:value = '11'">#9</xsl:when>
                    <xsl:when test="./i6:value = '3'">#10</xsl:when>
                    <xsl:when test="./i6:value = '4070'">#11</xsl:when>
                    <xsl:when test="./i6:value = '4071'">#12</xsl:when>
                    <xsl:when test="./i6:value = '4072'">#13</xsl:when>
                    <xsl:when test="./i6:value = '4073'">#14</xsl:when>
                    <xsl:when test="./i6:value = '4074'">#15</xsl:when>
                    <xsl:when test="./i6:value = '4075'">#16</xsl:when>
                    <xsl:when test="./i6:value = '4076'">#17</xsl:when>
                    <xsl:when test="./i6:value = '4077'">#18</xsl:when>
                    <xsl:when test="./i6:value = '4078'">#19</xsl:when>
                    <xsl:when test="./i6:value = '4079'">#20</xsl:when>
                    <xsl:when test="./i6:value = '61427'">hydrophilic</xsl:when>
                    <xsl:when test="./i6:value = '61428'">hydrophobic</xsl:when>
                    <xsl:when test="./i6:value = '64784'">acid anhydrides</xsl:when>
                    <xsl:when test="./i6:value = '64783'">acid halides</xsl:when>
                    <xsl:when test="./i6:value = '64785'">aldehydes</xsl:when>
                    <xsl:when test="./i6:value = '64833'">aldimines</xsl:when>
                    <xsl:when test="./i6:value = '64786'">alkoxysilanes (with alkoxy greater than C2-alkoxysilane)</xsl:when>
                    <xsl:when test="./i6:value = '64787'">allyl ethers</xsl:when>
                    <xsl:when test="./i6:value = '64788'">conjugated olefins (not contained in naturally occurring fats, oils and carboxylic acids)</xsl:when>
                    <xsl:when test="./i6:value = '64789'">cyanates</xsl:when>
                    <xsl:when test="./i6:value = '64790'">epoxides</xsl:when>
                    <xsl:when test="./i6:value = '64791'">hemiacetals</xsl:when>
                    <xsl:when test="./i6:value = '64792'">ketimines</xsl:when>
                    <xsl:when test="./i6:value = '64793'">methylolamides</xsl:when>
                    <xsl:when test="./i6:value = '64794'">methylolamines</xsl:when>
                    <xsl:when test="./i6:value = '64795'">methylolureas</xsl:when>
                    <xsl:when test="./i6:value = '64796'">unsubstituted positions ortho- or para- to phenolic hydroxyl</xsl:when>
                    <xsl:when test="./i6:value = '64841'">alkoxysilanes (with alkoxy of C1- or C2- alkoxysilane)</xsl:when>
                    <xsl:when test="./i6:value = '64782'">α-lactones</xsl:when>
                    <xsl:when test="./i6:value = '63228'">aziridines</xsl:when>
                    <xsl:when test="./i6:value = '64839'">azo groups</xsl:when>
                    <xsl:when test="./i6:value = '64840'">β-lactones</xsl:when>
                    <xsl:when test="./i6:value = '63229'">carbodiimides</xsl:when>
                    <xsl:when test="./i6:value = '65570'">cationic or potentially cationic</xsl:when>
                    <xsl:when test="./i6:value = '64835'">disulfides</xsl:when>
                    <xsl:when test="./i6:value = '63230'">halosilanes</xsl:when>
                    <xsl:when test="./i6:value = '63231'">hydrazines</xsl:when>
                    <xsl:when test="./i6:value = '64836'">hydrosilanes</xsl:when>
                    <xsl:when test="./i6:value = '63232'">isocyanates</xsl:when>
                    <xsl:when test="./i6:value = '63233'">isothiocyanates</xsl:when>
                    <xsl:when test="./i6:value = '63227'">pendant acrylates</xsl:when>
                    <xsl:when test="./i6:value = '64834'">pendant methacrylates</xsl:when>
                    <xsl:when test="./i6:value = '64837'">trithiocarbonates</xsl:when>
                    <xsl:when test="./i6:value = '63234'">vinyl sulfones</xsl:when>
                    <xsl:when test="./i6:value = '64797'">other reactive functional group that is not a low or moderate concern group</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedDescription | //xt:Constituents | //xt:Impurities | //xt:Additives | //xt:AttachedInformation2 | //xt:CrossReference | //xt:ShapeDescription | //xt:PartSizeDistribRangeRepeatable | //xt:Percentile | //xt:Structures | //xt:SurfaceTreatments | //xt:SurfaceTreatment | //xt:AttachedInformation | //xt:ReactiveFunctionalGroup | //xt:ReactiveFunctionalGroup">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'ReactiveFunctionalGroup'">Reactive functional group</xsl:when>
                    <xsl:when test="name(.) = 'Additives'"/>
                    <xsl:when test="name(.) = 'Percentile'">Percentile</xsl:when>
                    <xsl:when test="name(.) = 'SurfaceTreatments'">Surface treatments</xsl:when>
                    <xsl:when test="name(.) = 'ShapeDescription'">Shape description</xsl:when>
                    <xsl:when test="name(.) = 'AttachedInformation2'">Attached information</xsl:when>
                    <xsl:when test="name(.) = 'PartSizeDistribRangeRepeatable'">Particle size distribution and range</xsl:when>
                    <xsl:when test="name(.) = 'AttachedInformation'">Attached information</xsl:when>
                    <xsl:when test="name(.) = 'Constituents'"/>
                    <xsl:when test="name(.) = 'Impurities'"/>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Structures'">Structures</xsl:when>
                    <xsl:when test="name(.) = 'SurfaceTreatment'">Surface treatment</xsl:when>
                    <xsl:when test="name(.) = 'AttachedDescription'">Attached description / justification</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:GeneralInformation | //xt:RelatedCompositions | //xt:DegreeOfPurity | //xt:Constituents | //xt:Impurities | //xt:Additives | //xt:CharacterisationOfNanoforms | //xt:Shape | //xt:ParticleSizeDistributionAndRange | //xt:Crystallinity | //xt:SpecificSurfaceArea | //xt:SurfaceFunctionalisationTreatment | //xt:CharacterisationOfPolymers | //xt:PolymerMolecularWeight | //xt:ReactiveFunctionalGroups | //xt:ReactiveFunctionalGroupsModerateConcern | //xt:ReactiveFunctionalGroupsHighConcern | //xt:CombinedFunctionalGroupEquivalentWeight">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'Additives'">Additives</xsl:when>
                    <xsl:when test="name(.) = 'CombinedFunctionalGroupEquivalentWeight'">Combined functional group equivalent weight</xsl:when>
                    <xsl:when test="name(.) = 'DegreeOfPurity'">Degree of purity</xsl:when>
                    <xsl:when test="name(.) = 'Shape'">Shape</xsl:when>
                    <xsl:when test="name(.) = 'CharacterisationOfNanoforms'">Characterisation of nanoforms</xsl:when>
                    <xsl:when test="name(.) = 'SpecificSurfaceArea'">Specific surface area</xsl:when>
                    <xsl:when test="name(.) = 'SurfaceFunctionalisationTreatment'">Surface functionalisation / treatment</xsl:when>
                    <xsl:when test="name(.) = 'ReactiveFunctionalGroupsHighConcern'">Reactive functional groups - high concern</xsl:when>
                    <xsl:when test="name(.) = 'ParticleSizeDistributionAndRange'">Particle size distribution and range</xsl:when>
                    <xsl:when test="name(.) = 'Crystallinity'">Crystallinity</xsl:when>
                    <xsl:when test="name(.) = 'RelatedCompositions'">Related composition(s)</xsl:when>
                    <xsl:when test="name(.) = 'PolymerMolecularWeight'">Polymer molecular weight</xsl:when>
                    <xsl:when test="name(.) = 'Constituents'">Constituents</xsl:when>
                    <xsl:when test="name(.) = 'ReactiveFunctionalGroups'">Reactive functional groups</xsl:when>
                    <xsl:when test="name(.) = 'Impurities'">Impurities</xsl:when>
                    <xsl:when test="name(.) = 'CharacterisationOfPolymers'">Characterisation of polymers</xsl:when>
                    <xsl:when test="name(.) = 'GeneralInformation'">General Information</xsl:when>
                    <xsl:when test="name(.) = 'ReactiveFunctionalGroupsModerateConcern'">Reactive functional groups - moderate concern</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:Name">
        <tr>
            <td class="label">Name</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DescriptionOfComposition | //xt:JustificationForDeviations | //xt:Remarks | //xt:ReferenceToRelatedCompositions | //xt:Remarks | //xt:Remarks | //xt:DetailsOfFunctionInComposition | //xt:Remarks | //xt:NanoformName | //xt:NanoformSetName | //xt:JustificationForReportingSetOfSimilarNanoforms | //xt:Remarks | //xt:Remarks | //xt:JustificationForSetContainingMultipleShapeCategoriesOrShapes | //xt:Remarks | //xt:AdditionalInformation | //xt:Name | //xt:Description | //xt:Remarks | //xt:SurfaceTreatmentName | //xt:Remarks | //xt:Description | //xt:Remarks | //xt:Remarks | //xt:Remarks | //xt:Remarks">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'DescriptionOfComposition'">Description</xsl:when>
                    <xsl:when test="name(.) = 'AdditionalInformation'">Additional information</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForDeviations'">Justification for deviations</xsl:when>
                    <xsl:when test="name(.) = 'Description'">Description</xsl:when>
                    <xsl:when test="name(.) = 'SurfaceTreatmentName'">Surface treatment name</xsl:when>
                    <xsl:when test="name(.) = 'Name'">Name</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForReportingSetOfSimilarNanoforms'">Justification for reporting set of similar nanoforms</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceToRelatedCompositions'">Reference to related composition(s)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOfFunctionInComposition'">Details of function in composition</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForSetContainingMultipleShapeCategoriesOrShapes'">Justification for set containing multiple shape categories or shapes</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'NanoformName'">Name of nanoform</xsl:when>
                    <xsl:when test="name(.) = 'NanoformSetName'">Name of set of nanoforms</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//i6:country/i6:value">
        <xsl:choose>
            <xsl:when test=". = '2683'">Afghanistan </xsl:when>
            <xsl:when test=". = '2684'">Albania </xsl:when>
            <xsl:when test=". = '2685'">Algeria </xsl:when>
            <xsl:when test=". = '2686'">American Samoa </xsl:when>
            <xsl:when test=". = '2688'">Andorra </xsl:when>
            <xsl:when test=". = '2689'">Angola </xsl:when>
            <xsl:when test=". = '2690'">Anguilla </xsl:when>
            <xsl:when test=". = '2692'">Antarctica </xsl:when>
            <xsl:when test=". = '2695'">Antigua and Barbuda </xsl:when>
            <xsl:when test=". = '2696'">Argentina </xsl:when>
            <xsl:when test=". = '2697'">Armenia </xsl:when>
            <xsl:when test=". = '2698'">Aruba </xsl:when>
            <xsl:when test=". = '107'">Australia </xsl:when>
            <xsl:when test=". = '108'">Austria </xsl:when>
            <xsl:when test=". = '2701'">Azerbaijan </xsl:when>
            <xsl:when test=". = '2702'">Bahamas (the) </xsl:when>
            <xsl:when test=". = '2703'">Bahrain </xsl:when>
            <xsl:when test=". = '2704'">Bangladesh </xsl:when>
            <xsl:when test=". = '2705'">Barbados </xsl:when>
            <xsl:when test=". = '2707'">Belarus </xsl:when>
            <xsl:when test=". = '147'">Belgium </xsl:when>
            <xsl:when test=". = '2708'">Belize </xsl:when>
            <xsl:when test=". = '2709'">Benin </xsl:when>
            <xsl:when test=". = '2710'">Bermuda </xsl:when>
            <xsl:when test=". = '2711'">Bhutan </xsl:when>
            <xsl:when test=". = '2720'">Bolivia (Plurinational State of) </xsl:when>
            <xsl:when test=". = '65600'">Bonaire, Sint Eustatius and Saba </xsl:when>
            <xsl:when test=". = '2722'">Bosnia and Herzegovina </xsl:when>
            <xsl:when test=". = '2723'">Botswana </xsl:when>
            <xsl:when test=". = '2724'">Bouvet Island </xsl:when>
            <xsl:when test=". = '2725'">Brazil </xsl:when>
            <xsl:when test=". = '2726'">British Indian Ocean Territory (the) </xsl:when>
            <xsl:when test=". = '2727'">Brunei Darussalam </xsl:when>
            <xsl:when test=". = '184'">Bulgaria </xsl:when>
            <xsl:when test=". = '2729'">Burkina Faso </xsl:when>
            <xsl:when test=". = '2730'">Burundi </xsl:when>
            <xsl:when test=". = '2736'">Cabo Verde </xsl:when>
            <xsl:when test=". = '2734'">Cambodia </xsl:when>
            <xsl:when test=". = '2735'">Cameroon </xsl:when>
            <xsl:when test=". = '206'">Canada </xsl:when>
            <xsl:when test=". = '2746'">Cayman Islands (the) </xsl:when>
            <xsl:when test=". = '2747'">Central African Republic (the) </xsl:when>
            <xsl:when test=". = '2748'">Chad </xsl:when>
            <xsl:when test=". = '2749'">Chile </xsl:when>
            <xsl:when test=". = '2750'">China </xsl:when>
            <xsl:when test=". = '2751'">Christmas Island </xsl:when>
            <xsl:when test=". = '2754'">Cocos (Keeling) Islands (the) </xsl:when>
            <xsl:when test=". = '2755'">Colombia </xsl:when>
            <xsl:when test=". = '2759'">Comoros (the) </xsl:when>
            <xsl:when test=". = '2765'">Congo (the Democratic Republic of the) </xsl:when>
            <xsl:when test=". = '2764'">Congo (the) </xsl:when>
            <xsl:when test=". = '2769'">Cook Islands (the) </xsl:when>
            <xsl:when test=". = '2771'">Costa Rica </xsl:when>
            <xsl:when test=". = '286'">Croatia </xsl:when>
            <xsl:when test=". = '2773'">Cuba </xsl:when>
            <xsl:when test=". = '65601'">Curaçao </xsl:when>
            <xsl:when test=". = '304'">Cyprus </xsl:when>
            <xsl:when test=". = '307'">Czechia </xsl:when>
            <xsl:when test=". = '2774'">Côte d'Ivoire </xsl:when>
            <xsl:when test=". = '333'">Denmark </xsl:when>
            <xsl:when test=". = '2790'">Djibouti </xsl:when>
            <xsl:when test=". = '2791'">Dominica </xsl:when>
            <xsl:when test=". = '2792'">Dominican Republic (the) </xsl:when>
            <xsl:when test=". = '2799'">Ecuador </xsl:when>
            <xsl:when test=". = '2800'">Egypt </xsl:when>
            <xsl:when test=". = '2801'">El Salvador </xsl:when>
            <xsl:when test=". = '2803'">Equatorial Guinea </xsl:when>
            <xsl:when test=". = '2804'">Eritrea </xsl:when>
            <xsl:when test=". = '754'">Estonia </xsl:when>
            <xsl:when test=". = '3358'">Eswatini </xsl:when>
            <xsl:when test=". = '2805'">Ethiopia </xsl:when>
            <xsl:when test=". = '2813'">Falkland Islands (the) [Malvinas] </xsl:when>
            <xsl:when test=". = '2815'">Faroe Islands (the) </xsl:when>
            <xsl:when test=". = '2817'">Fiji </xsl:when>
            <xsl:when test=". = '766'">Finland </xsl:when>
            <xsl:when test=". = '779'">France </xsl:when>
            <xsl:when test=". = '2825'">French Guiana </xsl:when>
            <xsl:when test=". = '2826'">French Polynesia </xsl:when>
            <xsl:when test=". = '2827'">French Southern Territories (the) </xsl:when>
            <xsl:when test=". = '2828'">Gabon </xsl:when>
            <xsl:when test=". = '2829'">Gambia (the) </xsl:when>
            <xsl:when test=". = '2834'">Georgia </xsl:when>
            <xsl:when test=". = '807'">Germany </xsl:when>
            <xsl:when test=". = '2835'">Ghana </xsl:when>
            <xsl:when test=". = '2836'">Gibraltar </xsl:when>
            <xsl:when test=". = '810'">Greece </xsl:when>
            <xsl:when test=". = '2838'">Greenland </xsl:when>
            <xsl:when test=". = '2839'">Grenada </xsl:when>
            <xsl:when test=". = '2840'">Guadeloupe </xsl:when>
            <xsl:when test=". = '2841'">Guam </xsl:when>
            <xsl:when test=". = '2842'">Guatemala </xsl:when>
            <xsl:when test=". = '7818'">Guernsey </xsl:when>
            <xsl:when test=". = '2843'">Guinea </xsl:when>
            <xsl:when test=". = '2844'">Guinea-Bissau </xsl:when>
            <xsl:when test=". = '2845'">Guyana </xsl:when>
            <xsl:when test=". = '2846'">Haiti </xsl:when>
            <xsl:when test=". = '2851'">Heard Island and McDonald Islands </xsl:when>
            <xsl:when test=". = '2854'">Holy See (the) </xsl:when>
            <xsl:when test=". = '2855'">Honduras </xsl:when>
            <xsl:when test=". = '2856'">Hong Kong </xsl:when>
            <xsl:when test=". = '845'">Hungary </xsl:when>
            <xsl:when test=". = '882'">Iceland </xsl:when>
            <xsl:when test=". = '2865'">India </xsl:when>
            <xsl:when test=". = '2866'">Indonesia </xsl:when>
            <xsl:when test=". = '2870'">Iran (Islamic Republic of) </xsl:when>
            <xsl:when test=". = '2871'">Iraq </xsl:when>
            <xsl:when test=". = '911'">Ireland </xsl:when>
            <xsl:when test=". = '7819'">Isle of Man </xsl:when>
            <xsl:when test=". = '2876'">Israel </xsl:when>
            <xsl:when test=". = '916'">Italy </xsl:when>
            <xsl:when test=". = '2877'">Jamaica </xsl:when>
            <xsl:when test=". = '918'">Japan </xsl:when>
            <xsl:when test=". = '7820'">Jersey </xsl:when>
            <xsl:when test=". = '2878'">Jordan </xsl:when>
            <xsl:when test=". = '2879'">Kazakhstan </xsl:when>
            <xsl:when test=". = '2880'">Kenya </xsl:when>
            <xsl:when test=". = '2881'">Kiribati </xsl:when>
            <xsl:when test=". = '2882'">Korea (the Democratic People's Republic of) </xsl:when>
            <xsl:when test=". = '2883'">Korea (the Republic of) </xsl:when>
            <xsl:when test=". = '2884'">Kuwait </xsl:when>
            <xsl:when test=". = '2885'">Kyrgyzstan </xsl:when>
            <xsl:when test=". = '2886'">Lao People's Democratic Republic (the) </xsl:when>
            <xsl:when test=". = '985'">Latvia </xsl:when>
            <xsl:when test=". = '2887'">Lebanon </xsl:when>
            <xsl:when test=". = '2888'">Lesotho </xsl:when>
            <xsl:when test=". = '2889'">Liberia </xsl:when>
            <xsl:when test=". = '2890'">Libya </xsl:when>
            <xsl:when test=". = '2891'">Liechtenstein </xsl:when>
            <xsl:when test=". = '1024'">Lithuania </xsl:when>
            <xsl:when test=". = '1041'">Luxembourg </xsl:when>
            <xsl:when test=". = '2896'">Macao </xsl:when>
            <xsl:when test=". = '2898'">Madagascar </xsl:when>
            <xsl:when test=". = '2899'">Malawi </xsl:when>
            <xsl:when test=". = '2900'">Malaysia </xsl:when>
            <xsl:when test=". = '2901'">Maldives </xsl:when>
            <xsl:when test=". = '2902'">Mali </xsl:when>
            <xsl:when test=". = '1048'">Malta </xsl:when>
            <xsl:when test=". = '2904'">Marshall Islands (the) </xsl:when>
            <xsl:when test=". = '2905'">Martinique </xsl:when>
            <xsl:when test=". = '2908'">Mauritania </xsl:when>
            <xsl:when test=". = '2909'">Mauritius </xsl:when>
            <xsl:when test=". = '2910'">Mayotte </xsl:when>
            <xsl:when test=". = '1067'">Mexico </xsl:when>
            <xsl:when test=". = '3877'">Micronesia (Federated States of) </xsl:when>
            <xsl:when test=". = '2919'">Moldova (the Republic of) </xsl:when>
            <xsl:when test=". = '2921'">Monaco </xsl:when>
            <xsl:when test=". = '2922'">Mongolia </xsl:when>
            <xsl:when test=". = '7821'">Montenegro </xsl:when>
            <xsl:when test=". = '2924'">Montserrat </xsl:when>
            <xsl:when test=". = '2925'">Morocco </xsl:when>
            <xsl:when test=". = '2926'">Mozambique </xsl:when>
            <xsl:when test=". = '2930'">Myanmar </xsl:when>
            <xsl:when test=". = '2932'">Namibia </xsl:when>
            <xsl:when test=". = '2933'">Nauru </xsl:when>
            <xsl:when test=". = '2934'">Nepal </xsl:when>
            <xsl:when test=". = '1158'">Netherlands (the) </xsl:when>
            <xsl:when test=". = '2935'">Netherlands Antilles </xsl:when>
            <xsl:when test=". = '2938'">New Caledonia </xsl:when>
            <xsl:when test=". = '1161'">New Zealand </xsl:when>
            <xsl:when test=". = '2939'">Nicaragua </xsl:when>
            <xsl:when test=". = '2940'">Niger (the) </xsl:when>
            <xsl:when test=". = '2941'">Nigeria </xsl:when>
            <xsl:when test=". = '2942'">Niue </xsl:when>
            <xsl:when test=". = '2945'">Norfolk Island </xsl:when>
            <xsl:when test=". = '2897'">North Macedonia </xsl:when>
            <xsl:when test=". = '2946'">Northern Mariana Islands (the) </xsl:when>
            <xsl:when test=". = '1175'">Norway </xsl:when>
            <xsl:when test=". = '2977'">Oman </xsl:when>
            <xsl:when test=". = '2984'">Pakistan </xsl:when>
            <xsl:when test=". = '2985'">Palau </xsl:when>
            <xsl:when test=". = '2986'">Palestine, State of </xsl:when>
            <xsl:when test=". = '2987'">Panama </xsl:when>
            <xsl:when test=". = '2988'">Papua New Guinea </xsl:when>
            <xsl:when test=". = '2989'">Paraguay </xsl:when>
            <xsl:when test=". = '2994'">Peru </xsl:when>
            <xsl:when test=". = '2995'">Philippines (the) </xsl:when>
            <xsl:when test=". = '3000'">Pitcairn </xsl:when>
            <xsl:when test=". = '1394'">Poland </xsl:when>
            <xsl:when test=". = '1401'">Portugal </xsl:when>
            <xsl:when test=". = '3027'">Puerto Rico </xsl:when>
            <xsl:when test=". = '3028'">Qatar </xsl:when>
            <xsl:when test=". = '1496'">Romania </xsl:when>
            <xsl:when test=". = '3175'">Russian Federation (the) </xsl:when>
            <xsl:when test=". = '3176'">Rwanda </xsl:when>
            <xsl:when test=". = '3177'">Réunion </xsl:when>
            <xsl:when test=". = '7823'">Saint Barthélemy </xsl:when>
            <xsl:when test=". = '3318'">Saint Helena, Ascension and Tristan da Cunha </xsl:when>
            <xsl:when test=". = '3319'">Saint Kitts and Nevis </xsl:when>
            <xsl:when test=". = '3320'">Saint Lucia </xsl:when>
            <xsl:when test=". = '7824'">Saint Martin (French part) </xsl:when>
            <xsl:when test=". = '3321'">Saint Pierre and Miquelon </xsl:when>
            <xsl:when test=". = '3322'">Saint Vincent and the Grenadines </xsl:when>
            <xsl:when test=". = '3323'">Samoa </xsl:when>
            <xsl:when test=". = '3324'">San Marino </xsl:when>
            <xsl:when test=". = '3325'">Sao Tome and Principe </xsl:when>
            <xsl:when test=". = '3326'">Saudi Arabia </xsl:when>
            <xsl:when test=". = '3328'">Senegal </xsl:when>
            <xsl:when test=". = '3332'">Serbia </xsl:when>
            <xsl:when test=". = '3333'">Seychelles </xsl:when>
            <xsl:when test=". = '3336'">Sierra Leone </xsl:when>
            <xsl:when test=". = '3337'">Singapore </xsl:when>
            <xsl:when test=". = '65602'">Sint Maarten (Dutch part) </xsl:when>
            <xsl:when test=". = '3339'">Slovakia </xsl:when>
            <xsl:when test=". = '1562'">Slovenia </xsl:when>
            <xsl:when test=". = '3340'">Solomon Islands </xsl:when>
            <xsl:when test=". = '3343'">Somalia </xsl:when>
            <xsl:when test=". = '3344'">South Africa </xsl:when>
            <xsl:when test=". = '3345'">South Georgia and the South Sandwich Islands </xsl:when>
            <xsl:when test=". = '65603'">South Sudan </xsl:when>
            <xsl:when test=". = '1567'">Spain </xsl:when>
            <xsl:when test=". = '3346'">Sri Lanka </xsl:when>
            <xsl:when test=". = '3352'">Sudan (the) </xsl:when>
            <xsl:when test=". = '3355'">Suriname </xsl:when>
            <xsl:when test=". = '3357'">Svalbard and Jan Mayen </xsl:when>
            <xsl:when test=". = '1591'">Sweden </xsl:when>
            <xsl:when test=". = '1595'">Switzerland </xsl:when>
            <xsl:when test=". = '3359'">Syrian Arab Republic (the) </xsl:when>
            <xsl:when test=". = '3362'">Taiwan </xsl:when>
            <xsl:when test=". = '3363'">Tajikistan </xsl:when>
            <xsl:when test=". = '3364'">Tanzania, the United Republic of </xsl:when>
            <xsl:when test=". = '3366'">Thailand </xsl:when>
            <xsl:when test=". = '3370'">Timor-Leste </xsl:when>
            <xsl:when test=". = '3371'">Togo </xsl:when>
            <xsl:when test=". = '3372'">Tokelau </xsl:when>
            <xsl:when test=". = '3373'">Tonga </xsl:when>
            <xsl:when test=". = '3393'">Trinidad and Tobago </xsl:when>
            <xsl:when test=". = '3394'">Tunisia </xsl:when>
            <xsl:when test=". = '1641'">Turkey </xsl:when>
            <xsl:when test=". = '3395'">Turkmenistan </xsl:when>
            <xsl:when test=". = '3396'">Turks and Caicos Islands (the) </xsl:when>
            <xsl:when test=". = '3397'">Tuvalu </xsl:when>
            <xsl:when test=". = '3402'">Uganda </xsl:when>
            <xsl:when test=". = '3403'">Ukraine </xsl:when>
            <xsl:when test=". = '3406'">United Arab Emirates (the) </xsl:when>
            <xsl:when test=". = '1651'">United Kingdom of Great Britain and Northern Ireland (the) </xsl:when>
            <xsl:when test=". = '63145'">United Kingdom: Northern Ireland </xsl:when>
            <xsl:when test=". = '1652'">United States (the) </xsl:when>
            <xsl:when test=". = '3407'">United States Minor Outlying Islands (the) </xsl:when>
            <xsl:when test=". = '3410'">Uruguay </xsl:when>
            <xsl:when test=". = '3412'">Uzbekistan </xsl:when>
            <xsl:when test=". = '3414'">Vanuatu </xsl:when>
            <xsl:when test=". = '3416'">Venezuela (Bolivarian Republic of) </xsl:when>
            <xsl:when test=". = '3420'">Viet Nam </xsl:when>
            <xsl:when test=". = '3421'">Virgin Islands (British) </xsl:when>
            <xsl:when test=". = '3422'">Virgin Islands (U.S.) </xsl:when>
            <xsl:when test=". = '3425'">Wallis And Futuna </xsl:when>
            <xsl:when test=". = '3428'">Western Sahara </xsl:when>
            <xsl:when test=". = '3433'">Yemen </xsl:when>
            <xsl:when test=". = '3434'">Zambia </xsl:when>
            <xsl:when test=". = '3435'">Zimbabwe </xsl:when>
            <xsl:when test=". = '3446'">Åland Islands </xsl:when>
            <xsl:when test=". = '1173'">no data </xsl:when>
            <xsl:when test=". = '2207'">not specified </xsl:when>
            <xsl:when test=". = '1342'">other: </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//xt:DataProtection/i6:confidentiality">
        <xsl:choose>
            <xsl:when test=". = '2732'">CBI </xsl:when>
            <xsl:when test=". = '2859'">IP </xsl:when>
            <xsl:when test=". = '3441'">no PA </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
