<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-AcuteToxicityInhalation/7.0" version="1.0">
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
    <xsl:template match="//xt:ENDPOINT_STUDY_RECORD">
        <tr class="headerDocument">
            <td>Acute toxicity: inhalation</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RobustStudy'">Robust study summary</xsl:when>
                    <xsl:when test="name(.) = 'UsedForMSDS'">Used for SDS</xsl:when>
                    <xsl:when test="name(.) = 'UsedForClassification'">Used for classification</xsl:when>
                    <xsl:when test="name(.) = 'KeyResult'">Key result</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataProtection">
        <tr>
            <td class="label"/>
            <td class="value">
                <xsl:apply-templates/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:RelatedInformation | //xt:TestMaterialInformation">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RelatedInformation'">Related information</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterialInformation'">Test material information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:ExposureDuration">
        <tr>
            <td class="label">Exp. duration</td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '2113'"> min</xsl:when>
                    <xsl:when test="./unitCode = '1976'"> h</xsl:when>
                    <xsl:when test="./unitCode = '1839'"> d</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:MassMedianAerodynamicDiameter | //xt:GeometricStandardDeviation | //xt:DurationOfExposure | //xt:EffectLevel | //xt:cl">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'MassMedianAerodynamicDiameter'">Mass median aerodynamic diameter (MMAD)</xsl:when>
                    <xsl:when test="name(.) = 'EffectLevel'">Effect level</xsl:when>
                    <xsl:when test="name(.) = 'cl'">95% CL</xsl:when>
                    <xsl:when test="name(.) = 'GeometricStandardDeviation'">Geometric standard deviation (GSD)</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfExposure'">Duration of exposure</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:choose>
                    <xsl:when test="./i6:unitCode = '58237'"> nm</xsl:when>
                    <xsl:when test="./i6:unitCode = '2503'"> µm</xsl:when>
                    <xsl:when test="./i6:unitCode = '2120'"> mm</xsl:when>
                    <xsl:when test="./i6:unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./i6:unitCode = '2113'"> min</xsl:when>
                    <xsl:when test="./i6:unitCode = '1976'"> h</xsl:when>
                    <xsl:when test="./i6:unitCode = '1839'"> d</xsl:when>
                    <xsl:when test="./i6:unitCode = '116619'"> CFU/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116621'"> CFU/L air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116620'"> CFU/L air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116607'"> CFU/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116609'"> CFU/m³ air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116608'"> CFU/m³ air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116625'"> IU/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116627'"> IU/L air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116626'"> IU/L air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116613'"> IU/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116615'"> IU/m³ air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116614'"> IU/m³ air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116622'"> OB/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116624'"> OB/L air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116623'"> OB/L air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116610'"> OB/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116612'"> OB/m³ air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116611'"> OB/m³ air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2099'"> mg/L air</xsl:when>
                    <xsl:when test="./i6:unitCode = '2100'"> mg/L air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2101'"> mg/L air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2104'"> mg/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '2105'"> mg/m³ air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2106'"> mg/m³ air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '2283'"> ppm</xsl:when>
                    <xsl:when test="./i6:unitCode = '116628'"> spores/l air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116630'"> spores/l air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116629'"> spores/l air (nominal)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116616'"> spores/m³ air</xsl:when>
                    <xsl:when test="./i6:unitCode = '116618'"> spores/m³ air (analytical)</xsl:when>
                    <xsl:when test="./i6:unitCode = '116606'"> spores/m³ air (nominal)</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification">
        <tr>
            <td class="label">Justification for data waiving</td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '61314'">the study does not need to be conducted because the substance is classified as corrosive to the skin</xsl:when>
                    <xsl:when test="./i6:value = '61316'">the study does not need to be conducted because exposure of humans via inhalation is not likely taking into account the vapour pressure of the substance and/or the possibility of exposure to aerosols, particles or droplets of an inhalable size</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:TestType | //xt:LimitTest | //xt:Species | //xt:Strain | //xt:Sex | //xt:RouteOfAdministration | //xt:TypeOfInhalationExposure | //xt:Vehicle | //xt:AnalyticalVerificationOfTestAtmosphereConcentrations | //xt:ControlAnimals | //xt:Sex | //xt:Endpoint | //xt:BasedOn | //xt:RemarksOnResults | //xt:ClinicalSigns | //xt:Type | //xt:InterpretationOfResults">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Sex'">Sex</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'TestType'">Test type</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'TypeOfInhalationExposure'">Type of inhalation exposure</xsl:when>
                    <xsl:when test="name(.) = 'Vehicle'">Vehicle</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Dose descriptor</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'Species'">Species</xsl:when>
                    <xsl:when test="name(.) = 'InterpretationOfResults'">Interpretation of results</xsl:when>
                    <xsl:when test="name(.) = 'LimitTest'">Limit test</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'RouteOfAdministration'">Route of administration</xsl:when>
                    <xsl:when test="name(.) = 'ClinicalSigns'">Clinical signs</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'Strain'">Strain</xsl:when>
                    <xsl:when test="name(.) = 'ControlAnimals'">Control animals</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'BasedOn'">Based on</xsl:when>
                    <xsl:when test="name(.) = 'AnalyticalVerificationOfTestAtmosphereConcentrations'">Analytical verification of test atmosphere concentrations</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '2677'">acute toxicity: inhalation</xsl:when>
                    <xsl:when test="./i6:value = '1895'">experimental study</xsl:when>
                    <xsl:when test="./i6:value = '1896'">experimental study planned</xsl:when>
                    <xsl:when test="./i6:value = '60002'">experimental study planned (based on read-across)</xsl:when>
                    <xsl:when test="./i6:value = '14'">(Q)SAR</xsl:when>
                    <xsl:when test="./i6:value = '1885'">calculation (if not (Q)SAR)</xsl:when>
                    <xsl:when test="./i6:value = '2303'">read-across based on grouping of substances (category approach)</xsl:when>
                    <xsl:when test="./i6:value = '62036'">migrated information: read-across based on grouping of substances (category approach)</xsl:when>
                    <xsl:when test="./i6:value = '2304'">read-across from supporting substance (structural analogue or surrogate)</xsl:when>
                    <xsl:when test="./i6:value = '107831'">mixture rules calculation</xsl:when>
                    <xsl:when test="./i6:value = '107832'">read-across from similar mixture/product</xsl:when>
                    <xsl:when test="./i6:value = '62035'">migrated information: read-across from supporting substance (structural analogue or surrogate)</xsl:when>
                    <xsl:when test="./i6:value = '2207'">not specified</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '1173'">no data</xsl:when>
                    <xsl:when test="./i6:value = '921'">key study</xsl:when>
                    <xsl:when test="./i6:value = '1590'">supporting study</xsl:when>
                    <xsl:when test="./i6:value = '1661'">weight of evidence</xsl:when>
                    <xsl:when test="./i6:value = '8108'">disregarded due to major methodological deficiencies</xsl:when>
                    <xsl:when test="./i6:value = '60020'">other information</xsl:when>
                    <xsl:when test="./i6:value = '16'">1 (reliable without restriction)</xsl:when>
                    <xsl:when test="./i6:value = '18'">2 (reliable with restrictions)</xsl:when>
                    <xsl:when test="./i6:value = '22'">3 (not reliable)</xsl:when>
                    <xsl:when test="./i6:value = '24'">4 (not assignable)</xsl:when>
                    <xsl:when test="./i6:value = '60170'">guideline study</xsl:when>
                    <xsl:when test="./i6:value = '60171'">comparable to guideline study</xsl:when>
                    <xsl:when test="./i6:value = '60172'">test procedure in accordance with national standard methods</xsl:when>
                    <xsl:when test="./i6:value = '60173'">test procedure in accordance with generally accepted scientific standards and described in sufficient detail</xsl:when>
                    <xsl:when test="./i6:value = '60174'">guideline study without detailed documentation</xsl:when>
                    <xsl:when test="./i6:value = '60175'">guideline study with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60176'">comparable to guideline study with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60177'">test procedure in accordance with national standard methods with acceptable restrictions</xsl:when>
                    <xsl:when test="./i6:value = '60178'">study well documented, meets generally accepted scientific principles, acceptable for assessment</xsl:when>
                    <xsl:when test="./i6:value = '60179'">accepted calculation method</xsl:when>
                    <xsl:when test="./i6:value = '60180'">data from handbook or collection of data</xsl:when>
                    <xsl:when test="./i6:value = '60181'">significant methodological deficiencies</xsl:when>
                    <xsl:when test="./i6:value = '60182'">unsuitable test system</xsl:when>
                    <xsl:when test="./i6:value = '60183'">abstract</xsl:when>
                    <xsl:when test="./i6:value = '60184'">secondary literature</xsl:when>
                    <xsl:when test="./i6:value = '60185'">documentation insufficient for assessment</xsl:when>
                    <xsl:when test="./i6:value = '60186'">results derived from a valid (Q)SAR model and falling into its applicability domain, with adequate and reliable documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60187'">results derived from a valid (Q)SAR model and falling into its applicability domain, with limited documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60188'">results derived from a valid (Q)SAR model, but  not (completely) falling into its applicability domain, with adequate and reliable documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '60189'">results derived from a (Q)SAR model, with limited documentation / justification, but validity of model and reliability of prediction considered adequate based on a generally acknowledged source</xsl:when>
                    <xsl:when test="./i6:value = '60190'">results derived from a valid (Q)SAR model, but not (completely) falling into its applicability domain, and documentation / justification is limited</xsl:when>
                    <xsl:when test="./i6:value = '60191'">results derived from a (Q)SAR model, with limited documentation / justification</xsl:when>
                    <xsl:when test="./i6:value = '1588'">study technically not feasible</xsl:when>
                    <xsl:when test="./i6:value = '1587'">study scientifically not necessary / other information available</xsl:when>
                    <xsl:when test="./i6:value = '982'">exposure considerations</xsl:when>
                    <xsl:when test="./i6:value = '60022'">study waived due to provisions of other regulation</xsl:when>
                    <xsl:when test="./i6:value = '2533'">other justification</xsl:when>
                    <xsl:when test="./i6:value = '60006'">data waiving: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60007'">exposure-related information</xsl:when>
                    <xsl:when test="./i6:value = '60008'">read-across: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60009'">(Q)SAR model reporting (QMRF)</xsl:when>
                    <xsl:when test="./i6:value = '60010'">(Q)SAR prediction reporting (QPRF)</xsl:when>
                    <xsl:when test="./i6:value = '60011'">(Q)SAR model and prediction reporting (QMRF/QPRF)</xsl:when>
                    <xsl:when test="./i6:value = '60012'">(Q)SAR: supporting information</xsl:when>
                    <xsl:when test="./i6:value = '60013'">justification, other:</xsl:when>
                    <xsl:when test="./i6:value = '60014'">assessment report</xsl:when>
                    <xsl:when test="./i6:value = '60015'">read-across source</xsl:when>
                    <xsl:when test="./i6:value = '60016'">reference to other assay used for intermediate effect derivation</xsl:when>
                    <xsl:when test="./i6:value = '60017'">reference to same study</xsl:when>
                    <xsl:when test="./i6:value = '60018'">reference to other study</xsl:when>
                    <xsl:when test="./i6:value = '1838'">data submitter is data owner</xsl:when>
                    <xsl:when test="./i6:value = '1837'">data submitter has Letter of Access</xsl:when>
                    <xsl:when test="./i6:value = '1835'">data no longer protected</xsl:when>
                    <xsl:when test="./i6:value = '1836'">data published</xsl:when>
                    <xsl:when test="./i6:value = '60023'">data submitter has permission to refer</xsl:when>
                    <xsl:when test="./i6:value = '2193'">not applicable</xsl:when>
                    <xsl:when test="./i6:value = '2480'">yes</xsl:when>
                    <xsl:when test="./i6:value = '4161'">yes, but willing to share</xsl:when>
                    <xsl:when test="./i6:value = '4162'">yes, but not willing to share</xsl:when>
                    <xsl:when test="./i6:value = '1680'">according to guideline</xsl:when>
                    <xsl:when test="./i6:value = '1880'">equivalent or similar to guideline</xsl:when>
                    <xsl:when test="./i6:value = '2172'">no guideline followed</xsl:when>
                    <xsl:when test="./i6:value = '2171'">no guideline available</xsl:when>
                    <xsl:when test="./i6:value = '2175'">no guideline required</xsl:when>
                    <xsl:when test="./i6:value = '407'">EPA OPP 81-3 (Acute inhalation toxicity)</xsl:when>
                    <xsl:when test="./i6:value = '503'">EPA OPPTS 870.1300 (Acute inhalation toxicity)</xsl:when>
                    <xsl:when test="./i6:value = '107871'">EPA OPPTS 885.3150 (Microbial Pesticide, Acute Pulmonary Toxicity/Pathogenicity)</xsl:when>
                    <xsl:when test="./i6:value = '599'">EPA OTS 798.1150 (Acute inhalation toxicity)</xsl:when>
                    <xsl:when test="./i6:value = '675'">EU Method B.2 (Acute Toxicity (Inhalation))</xsl:when>
                    <xsl:when test="./i6:value = '61317'">EU Method B.52 (Acute Inhalation Toxicity - Acute Toxic Class Method)</xsl:when>
                    <xsl:when test="./i6:value = '1251'">OECD Guideline 403 (Acute Inhalation Toxicity)</xsl:when>
                    <xsl:when test="./i6:value = '65598'">OECD Guideline 433 (Acute Inhalation Toxicity: Fixed Concentration Procedure)</xsl:when>
                    <xsl:when test="./i6:value = '1278'">OECD Guideline 433 draft (Acute Inhalation Toxicity: Fixed Concentration Procedure) (not officially approved)</xsl:when>
                    <xsl:when test="./i6:value = '1281'">OECD Guideline 436 (Acute Inhalation Toxicity: Acute Toxic Class Method)</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '51'">acute toxic class method</xsl:when>
                    <xsl:when test="./i6:value = '4827'">fixed concentration procedure</xsl:when>
                    <xsl:when test="./i6:value = '61919'">traditional method</xsl:when>
                    <xsl:when test="./i6:value = '61920'">concentration x time method</xsl:when>
                    <xsl:when test="./i6:value = '1578'">standard acute method</xsl:when>
                    <xsl:when test="./i6:value = '3485'">rat</xsl:when>
                    <xsl:when test="./i6:value = '3530'">cat</xsl:when>
                    <xsl:when test="./i6:value = '3531'">cattle</xsl:when>
                    <xsl:when test="./i6:value = '3532'">dog</xsl:when>
                    <xsl:when test="./i6:value = '3533'">gerbil</xsl:when>
                    <xsl:when test="./i6:value = '3534'">guinea pig</xsl:when>
                    <xsl:when test="./i6:value = '3535'">hamster</xsl:when>
                    <xsl:when test="./i6:value = '3536'">hamster, Armenian</xsl:when>
                    <xsl:when test="./i6:value = '3537'">hamster, Chinese</xsl:when>
                    <xsl:when test="./i6:value = '3538'">hamster, Syrian</xsl:when>
                    <xsl:when test="./i6:value = '3539'">hen</xsl:when>
                    <xsl:when test="./i6:value = '3541'">miniature swine</xsl:when>
                    <xsl:when test="./i6:value = '3542'">monkey</xsl:when>
                    <xsl:when test="./i6:value = '3543'">mouse</xsl:when>
                    <xsl:when test="./i6:value = '3545'">pig</xsl:when>
                    <xsl:when test="./i6:value = '3546'">primate</xsl:when>
                    <xsl:when test="./i6:value = '3547'">rabbit</xsl:when>
                    <xsl:when test="./i6:value = '3548'">sheep</xsl:when>
                    <xsl:when test="./i6:value = '3544'">other:</xsl:when>
                    <xsl:when test="./i6:value = '3501'">AKR</xsl:when>
                    <xsl:when test="./i6:value = '3487'">Abyssinian</xsl:when>
                    <xsl:when test="./i6:value = '3552'">Angora</xsl:when>
                    <xsl:when test="./i6:value = '3502'">B6C3F1</xsl:when>
                    <xsl:when test="./i6:value = '3503'">Balb/c</xsl:when>
                    <xsl:when test="./i6:value = '3486'">Beagle</xsl:when>
                    <xsl:when test="./i6:value = '3553'">Belgian Hare</xsl:when>
                    <xsl:when test="./i6:value = '3565'">Brown Norway</xsl:when>
                    <xsl:when test="./i6:value = '3504'">C3H</xsl:when>
                    <xsl:when test="./i6:value = '3505'">C57BL</xsl:when>
                    <xsl:when test="./i6:value = '3506'">CAF1</xsl:when>
                    <xsl:when test="./i6:value = '3507'">CB6F1</xsl:when>
                    <xsl:when test="./i6:value = '3508'">CBA</xsl:when>
                    <xsl:when test="./i6:value = '3509'">CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3510'">CF-1</xsl:when>
                    <xsl:when test="./i6:value = '3554'">Californian</xsl:when>
                    <xsl:when test="./i6:value = '3555'">Chinchilla</xsl:when>
                    <xsl:when test="./i6:value = '3566'">Crj: CD(SD)</xsl:when>
                    <xsl:when test="./i6:value = '3511'">DBA</xsl:when>
                    <xsl:when test="./i6:value = '3512'">DBF1</xsl:when>
                    <xsl:when test="./i6:value = '3488'">Dunkin-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3556'">Dutch</xsl:when>
                    <xsl:when test="./i6:value = '3513'">FVB</xsl:when>
                    <xsl:when test="./i6:value = '3567'">Fischer 344</xsl:when>
                    <xsl:when test="./i6:value = '3568'">Fischer 344/DuCrj</xsl:when>
                    <xsl:when test="./i6:value = '3557'">Flemish Giant</xsl:when>
                    <xsl:when test="./i6:value = '3489'">Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3558'">Himalayan</xsl:when>
                    <xsl:when test="./i6:value = '3514'">ICL-ICR</xsl:when>
                    <xsl:when test="./i6:value = '3515'">ICR</xsl:when>
                    <xsl:when test="./i6:value = '3569'">Lewis</xsl:when>
                    <xsl:when test="./i6:value = '3570'">Long-Evans</xsl:when>
                    <xsl:when test="./i6:value = '3498'">Macaca fascicularis</xsl:when>
                    <xsl:when test="./i6:value = '3499'">Marmoset</xsl:when>
                    <xsl:when test="./i6:value = '3500'">Mulatta arctoides</xsl:when>
                    <xsl:when test="./i6:value = '3516'">NMRI</xsl:when>
                    <xsl:when test="./i6:value = '3559'">New Zealand Black</xsl:when>
                    <xsl:when test="./i6:value = '3560'">New Zealand Red</xsl:when>
                    <xsl:when test="./i6:value = '3561'">New Zealand White</xsl:when>
                    <xsl:when test="./i6:value = '60957'">Nude</xsl:when>
                    <xsl:when test="./i6:value = '3517'">Nude Balb/cAnN</xsl:when>
                    <xsl:when test="./i6:value = '3518'">Nude CD-1</xsl:when>
                    <xsl:when test="./i6:value = '3571'">Osborne-Mendel</xsl:when>
                    <xsl:when test="./i6:value = '3490'">Peruvian</xsl:when>
                    <xsl:when test="./i6:value = '3491'">Pirbright-Hartley</xsl:when>
                    <xsl:when test="./i6:value = '3562'">Polish</xsl:when>
                    <xsl:when test="./i6:value = '108737'">Rainbow trout</xsl:when>
                    <xsl:when test="./i6:value = '3520'">SIV 50</xsl:when>
                    <xsl:when test="./i6:value = '3521'">SKH/HR1</xsl:when>
                    <xsl:when test="./i6:value = '3563'">San Juan</xsl:when>
                    <xsl:when test="./i6:value = '3519'">Sencar</xsl:when>
                    <xsl:when test="./i6:value = '3572'">Sherman</xsl:when>
                    <xsl:when test="./i6:value = '3492'">Shorthair</xsl:when>
                    <xsl:when test="./i6:value = '3573'">Sprague-Dawley</xsl:when>
                    <xsl:when test="./i6:value = '3522'">Strain A</xsl:when>
                    <xsl:when test="./i6:value = '3523'">Swiss</xsl:when>
                    <xsl:when test="./i6:value = '3524'">Swiss Webster</xsl:when>
                    <xsl:when test="./i6:value = '9007'">Tif:MAGf</xsl:when>
                    <xsl:when test="./i6:value = '3564'">Vienna White</xsl:when>
                    <xsl:when test="./i6:value = '3574'">Wistar</xsl:when>
                    <xsl:when test="./i6:value = '3575'">Wistar Kyoto (WKY)</xsl:when>
                    <xsl:when test="./i6:value = '3576'">Zucker</xsl:when>
                    <xsl:when test="./i6:value = '1904'">female</xsl:when>
                    <xsl:when test="./i6:value = '2051'">male</xsl:when>
                    <xsl:when test="./i6:value = '2052'">male/female</xsl:when>
                    <xsl:when test="./i6:value = '1994'">inhalation: gas</xsl:when>
                    <xsl:when test="./i6:value = '1992'">inhalation: aerosol</xsl:when>
                    <xsl:when test="./i6:value = '1993'">inhalation: dust</xsl:when>
                    <xsl:when test="./i6:value = '9155'">inhalation: mist</xsl:when>
                    <xsl:when test="./i6:value = '1995'">inhalation: vapour</xsl:when>
                    <xsl:when test="./i6:value = '61204'">inhalation: mixture of gas, vapour and aerosol</xsl:when>
                    <xsl:when test="./i6:value = '61205'">inhalation: mixture of vapour and aerosol / mist</xsl:when>
                    <xsl:when test="./i6:value = '61206'">inhalation: mixture of gas and vapour</xsl:when>
                    <xsl:when test="./i6:value = '1991'">inhalation</xsl:when>
                    <xsl:when test="./i6:value = '2191'">nose only</xsl:when>
                    <xsl:when test="./i6:value = '1961'">head only</xsl:when>
                    <xsl:when test="./i6:value = '65624'">snout only</xsl:when>
                    <xsl:when test="./i6:value = '2192'">nose/head only</xsl:when>
                    <xsl:when test="./i6:value = '2470'">whole body</xsl:when>
                    <xsl:when test="./i6:value = '1712'">air</xsl:when>
                    <xsl:when test="./i6:value = '8130'">clean air</xsl:when>
                    <xsl:when test="./i6:value = '8131'">oxygen</xsl:when>
                    <xsl:when test="./i6:value = '1659'">water</xsl:when>
                    <xsl:when test="./i6:value = '922'">LC0</xsl:when>
                    <xsl:when test="./i6:value = '61956'">LC01</xsl:when>
                    <xsl:when test="./i6:value = '926'">LC50</xsl:when>
                    <xsl:when test="./i6:value = '924'">LC100</xsl:when>
                    <xsl:when test="./i6:value = '927'">LCLo</xsl:when>
                    <xsl:when test="./i6:value = '1857'">discriminating conc.</xsl:when>
                    <xsl:when test="./i6:value = '61957'">LC50 cut-off</xsl:when>
                    <xsl:when test="./i6:value = '1758'">test mat.</xsl:when>
                    <xsl:when test="./i6:value = '60281'">test mat. (total fraction)</xsl:when>
                    <xsl:when test="./i6:value = '60282'">test mat. (dissolved fraction)</xsl:when>
                    <xsl:when test="./i6:value = '1754'">act. ingr.</xsl:when>
                    <xsl:when test="./i6:value = '60283'">act. ingr. (total fraction)</xsl:when>
                    <xsl:when test="./i6:value = '60284'">act. ingr. (dissolved fraction)</xsl:when>
                    <xsl:when test="./i6:value = '1756'">element</xsl:when>
                    <xsl:when test="./i6:value = '60285'">element (total fraction)</xsl:when>
                    <xsl:when test="./i6:value = '60286'">element (dissolved fraction)</xsl:when>
                    <xsl:when test="./i6:value = '1755'">dissolved</xsl:when>
                    <xsl:when test="./i6:value = '1757'">labile/free</xsl:when>
                    <xsl:when test="./i6:value = '61027'">not determinable due to absence of adverse toxic effects</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '65609'">bodyweight loss</xsl:when>
                    <xsl:when test="./i6:value = '65610'">coma</xsl:when>
                    <xsl:when test="./i6:value = '65611'">convulsions</xsl:when>
                    <xsl:when test="./i6:value = '65612'">diarrhoea</xsl:when>
                    <xsl:when test="./i6:value = '65613'">irregular respiration</xsl:when>
                    <xsl:when test="./i6:value = '65614'">lethargy (hypoactivity)</xsl:when>
                    <xsl:when test="./i6:value = '65615'">observations of tremors</xsl:when>
                    <xsl:when test="./i6:value = '65616'">salivation</xsl:when>
                    <xsl:when test="./i6:value = '65617'">sleep</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                    <xsl:when test="./i6:value = '61349'">Category 1 based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '61350'">Category 2 based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '61351'">Category 3 based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '61352'">Category 4 based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '61353'">Category 5 based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60364'">study cannot be used for classification</xsl:when>
                    <xsl:when test="./i6:value = '60366'">GHS criteria not met</xsl:when>
                    <xsl:when test="./i6:value = '2286'">practically nontoxic</xsl:when>
                    <xsl:when test="./i6:value = '2312'">relatively harmless</xsl:when>
                    <xsl:when test="./i6:value = '2373'">sligthly toxic</xsl:when>
                    <xsl:when test="./i6:value = '2126'">moderately toxic</xsl:when>
                    <xsl:when test="./i6:value = '1960'">harmful</xsl:when>
                    <xsl:when test="./i6:value = '2425'">toxic</xsl:when>
                    <xsl:when test="./i6:value = '1972'">highly toxic</xsl:when>
                    <xsl:when test="./i6:value = '2450'">very toxic</xsl:when>
                    <xsl:when test="./i6:value = '1901'">extremely toxic</xsl:when>
                    <xsl:when test="./i6:value = '1617'">Toxicity Category I</xsl:when>
                    <xsl:when test="./i6:value = '1618'">Toxicity Category II</xsl:when>
                    <xsl:when test="./i6:value = '1619'">Toxicity Category III</xsl:when>
                    <xsl:when test="./i6:value = '1620'">Toxicity Category IV</xsl:when>
                    <xsl:when test="./i6:value = '1621'">Toxicity Category V</xsl:when>
                    <xsl:when test="./i6:value = '2195'">not classified</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:EffectLevels | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'EffectLevels'">Effect levels</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'AttachedJustification'">Attached justification</xsl:when>
                    <xsl:when test="name(.) = 'AttachedBackgroundMaterial'">Attachments</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:TestAnimals | //xt:AdministrationExposure | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'TestAnimals'">Test animals</xsl:when>
                    <xsl:when test="name(.) = 'AdministrationExposure'">Administration / exposure</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnMaterialsAndMethodsInclTables'">Any other information on materials and methods incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'ResultsAndDiscussion'">Results and discussion</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:NoOfAnimalsPerSexPerDose">
        <tr>
            <td class="label">No. of animals per sex per dose</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:OrganismDetails | //xt:RemarksOnMMAD | //xt:DetailsOnInhalationExposure | //xt:RemarksOnDuration | //xt:Concentrations | //xt:DetailsOnStudyDesign | //xt:Statistics | //xt:OtherInformation | //xt:Preliminary | //xt:Mortality | //xt:BodyWeight | //xt:GrossPathology | //xt:OtherFindings | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Preliminary'">Preliminary study</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnInhalationExposure'">Details on inhalation exposure</xsl:when>
                    <xsl:when test="name(.) = 'BodyWeight'">Body weight</xsl:when>
                    <xsl:when test="name(.) = 'OrganismDetails'">Details on test animals or test system and environmental conditions</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'Mortality'">Mortality</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnStudyDesign'">Details on study design</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'OtherFindings'">Other findings</xsl:when>
                    <xsl:when test="name(.) = 'Concentrations'">Concentrations</xsl:when>
                    <xsl:when test="name(.) = 'Statistics'">Statistics</xsl:when>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'GrossPathology'">Gross pathology</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnMMAD'">Remark on MMAD/GSD</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnDuration'">Remarks on duration</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudyConfidential'">Specific details on test material used for the study (confidential)</xsl:when>
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
