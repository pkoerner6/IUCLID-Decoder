<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-Flammability/7.0" version="1.0">
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
            <td>Flammability</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult | //xt:KeyResult">
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
    <xsl:template match="//xt:MoistureWt | //xt:RelativeAirHumidity | //xt:RelativeAirHumidity | //xt:MaxTempReached | //xt:InductionTimeH">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'MaxTempReached'">Max. temp. reached</xsl:when>
                    <xsl:when test="name(.) = 'InductionTimeH'">Induction time (h)</xsl:when>
                    <xsl:when test="name(.) = 'MoistureWt'">Moisture (wt %)</xsl:when>
                    <xsl:when test="name(.) = 'RelativeAirHumidity'">Relative air humidity (%)</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Temp | //xt:Temp | //xt:MaxRateOfGasRelease">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Temp'">Temp.</xsl:when>
                    <xsl:when test="name(.) = 'MaxRateOfGasRelease'">Max. rate of gas release</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '2493'"> °C</xsl:when>
                    <xsl:when test="./unitCode = '3887'"> K</xsl:when>
                    <xsl:when test="./unitCode = '3888'"> °F</xsl:when>
                    <xsl:when test="./unitCode = '60424'"> L/kg min</xsl:when>
                    <xsl:when test="./unitCode = '60425'"> L/kg h</xsl:when>
                    <xsl:when test="./unitCode = '1342'"> other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Value | //xt:ContentOfFlammableComponents | //xt:Value | //xt:BurningTime | //xt:Results | //xt:Results">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Results'">Result</xsl:when>
                    <xsl:when test="name(.) = 'Value'">Value</xsl:when>
                    <xsl:when test="name(.) = 'BurningTime'">Burning time</xsl:when>
                    <xsl:when test="name(.) = 'ContentOfFlammableComponents'">Content of flammable components (%)</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:choose>
                    <xsl:when test="./i6:unitCode = '2453'"> vol%</xsl:when>
                    <xsl:when test="./i6:unitCode = '60204'"> mol%</xsl:when>
                    <xsl:when test="./i6:unitCode = '60205'"> % (not further specified)</xsl:when>
                    <xsl:when test="./i6:unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./i6:unitCode = '2329'"> s</xsl:when>
                    <xsl:when test="./i6:unitCode = '2113'"> min</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification | //xt:TestProcedure">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'TestProcedure'">Test procedure</xsl:when>
                    <xsl:when test="name(.) = 'DataWaivingJustification'">Justification for data waiving</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60372'">the study does not need to be conducted because the substance is a gas and the concentration of the flammable gas in a mixture with inert gases is so low that, when mixed with air, the concentration is all time below the lower limit.</xsl:when>
                    <xsl:when test="./i6:value = '60227'">the study does not need to be conducted for explosives</xsl:when>
                    <xsl:when test="./i6:value = '60329'">the study does not need to be conducted because the substance is pyrophoric</xsl:when>
                    <xsl:when test="./i6:value = '60316'">the study does not need to be conducted for organic peroxides</xsl:when>
                    <xsl:when test="./i6:value = '60228'">the study does not need to be conducted for self-reactive substances</xsl:when>
                    <xsl:when test="./i6:value = '60373'">the study does not need to be conducted because the substance is a solid</xsl:when>
                    <xsl:when test="./i6:value = '60374'">the study does not need to be conducted because the substance is a liquid</xsl:when>
                    <xsl:when test="./i6:value = '60375'">the study does not need to be conducted because the substance is an aerosol and aerosols shall not be classified as flammable gases</xsl:when>
                    <xsl:when test="./i6:value = '60376'">the study does not need to be conducted because the aerosol is not submitted to the flammability classification procedures, but is classified as 'extremely flammable' (Aerosol, Category 1)</xsl:when>
                    <xsl:when test="./i6:value = '60377'">the study does not need to be conducted because the substance is no aerosol</xsl:when>
                    <xsl:when test="./i6:value = '60378'">the study does not need to be conducted for self-reactive substances / mixtures</xsl:when>
                    <xsl:when test="./i6:value = '61899'">the study does not need to be conducted because the substance is a gas</xsl:when>
                    <xsl:when test="./i6:value = '60379'">the study does not need to be conducted because the substance is known to be stable in contact with air at room temperature for prolonged periods of time (days) and hence, the classification procedure does not need to be applied</xsl:when>
                    <xsl:when test="./i6:value = '60380'">the study does not need to be conducted because the substance is completely molten at 160°C</xsl:when>
                    <xsl:when test="./i6:value = '60381'">the study does not need to be conducted because the substance undergoes exothermic decomposition at a temperature below or equal to 140°C</xsl:when>
                    <xsl:when test="./i6:value = '60382'">the study does not need to be conducted because the organic substance does not contain metals or metalloids and hence, the classification procedure does not need to be applied</xsl:when>
                    <xsl:when test="./i6:value = '60383'">the study does not need to be conducted because the experience in production or handling shows that the substance does not react with water, e.g. the substance is manufactured with water or washed with water</xsl:when>
                    <xsl:when test="./i6:value = '60384'">the study does not need to be conducted because the substance is known to be soluble in water to form a stable mixture</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '60418'">step 1</xsl:when>
                    <xsl:when test="./i6:value = '60419'">step 2</xsl:when>
                    <xsl:when test="./i6:value = '60420'">step 3</xsl:when>
                    <xsl:when test="./i6:value = '60421'">step 4</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:OtherQualityAssurance | //xt:Parameter | //xt:RemarksOnResults | //xt:TypeOfAerosolTested | //xt:TestParameter | //xt:RemarksOnResults | //xt:TestProcedure | //xt:RemarksOnResults | //xt:TestProcedure | //xt:RemarksOnResults | //xt:TestProcedure | //xt:RemarksOnResults | //xt:TestProcedure | //xt:Results | //xt:RemarksOnResults | //xt:IdentityOfEvolvedGas | //xt:RemarksOnResults | //xt:Type | //xt:InterpretationOfResults">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'TestProcedure'">Test procedure</xsl:when>
                    <xsl:when test="name(.) = 'OtherQualityAssurance'">Other quality assurance</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'IdentityOfEvolvedGas'">Identity of evolved gas</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Endpoint</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'Results'">Result</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'Parameter'">Parameter</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'TypeOfAerosolTested'">Type of aerosol tested</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'InterpretationOfResults'">Interpretation of results</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                    <xsl:when test="name(.) = 'TestParameter'">Test parameter</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60087'">aerosols</xsl:when>
                    <xsl:when test="./i6:value = '60371'">flammable gases</xsl:when>
                    <xsl:when test="./i6:value = '61876'">flammable liquids: obsolete as covered by section 'Flash point'</xsl:when>
                    <xsl:when test="./i6:value = '60089'">flammable solids</xsl:when>
                    <xsl:when test="./i6:value = '60090'">pyrophoric liquids</xsl:when>
                    <xsl:when test="./i6:value = '60091'">pyrophoric solids</xsl:when>
                    <xsl:when test="./i6:value = '60092'">self-heating substances / mixtures</xsl:when>
                    <xsl:when test="./i6:value = '60093'">substances / mixtures which in contact with water emit flammable gases</xsl:when>
                    <xsl:when test="./i6:value = '60094'">flammability, other</xsl:when>
                    <xsl:when test="./i6:value = '61931'">flammability</xsl:when>
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
                    <xsl:when test="./i6:value = '60095'">UN Manual of Tests and Criteria: Test N.1 (Test method for readily combustible solids)</xsl:when>
                    <xsl:when test="./i6:value = '60096'">UN Manual of Tests and Criteria: Test N.2 (Test method for pyrophoric solids)</xsl:when>
                    <xsl:when test="./i6:value = '60097'">UN Manual of Tests and Criteria: Test N.3 (Test method for pyrophoric liquids)</xsl:when>
                    <xsl:when test="./i6:value = '60098'">UN Manual of Tests and Criteria: Test N.4 (Test method for self-heating substances)</xsl:when>
                    <xsl:when test="./i6:value = '60099'">UN Manual of Tests and Criteria: Test N.5 (Test method for substances which in contact with water emit flammable gases)</xsl:when>
                    <xsl:when test="./i6:value = '60100'">UN Manual of Tests and Criteria: Part III, section 31.4, Ignition distance test for spray aerosols</xsl:when>
                    <xsl:when test="./i6:value = '60101'">UN Manual of Tests and Criteria: Part III, section 31.5, Enclosed space ignition test</xsl:when>
                    <xsl:when test="./i6:value = '60102'">UN Manual of Tests and Criteria: Part III, section 31.6, Aerosol foam flammability test</xsl:when>
                    <xsl:when test="./i6:value = '647'">EU Method A.10 (Flammability (Solids))</xsl:when>
                    <xsl:when test="./i6:value = '648'">EU Method A.11 (Flammability (Gases))</xsl:when>
                    <xsl:when test="./i6:value = '649'">EU Method A.12 (Flammability (Contact with Water))</xsl:when>
                    <xsl:when test="./i6:value = '650'">EU Method A.13 (Pyrophoric Properties of Solids and Liquids)</xsl:when>
                    <xsl:when test="./i6:value = '4086'">EPA OPPTS 830.6315 (Flammability)</xsl:when>
                    <xsl:when test="./i6:value = '60103'">EN 1839, Method B (Determination of explosion limits of gases and vapours)</xsl:when>
                    <xsl:when test="./i6:value = '60104'">EN 1839, Method T (Determination of explosion limits of gases and vapours)</xsl:when>
                    <xsl:when test="./i6:value = '60105'">ISO 10156 (Gases and gas mixtures - Determination of fire potential and oxidizing ability for the selection of cylinder valve outlets)</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '60005'">ISO/IEC 17025 (General requirements for the competence of testing and calibration laboratories)</xsl:when>
                    <xsl:when test="./i6:value = '60202'">lower explosion limit</xsl:when>
                    <xsl:when test="./i6:value = '60203'">upper explosion limit</xsl:when>
                    <xsl:when test="./i6:value = '60106'">not flammable based on calculation method</xsl:when>
                    <xsl:when test="./i6:value = '60107'">no flammable range with air at 20°C and 101.3 kPa</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '60037'">aerosol dispenser: not specified</xsl:when>
                    <xsl:when test="./i6:value = '60038'">aerosol dispenser: foam aerosol</xsl:when>
                    <xsl:when test="./i6:value = '60039'">aerosol dispenser: spray aerosol</xsl:when>
                    <xsl:when test="./i6:value = '60209'">chemical heat of combustion (kJ/g)</xsl:when>
                    <xsl:when test="./i6:value = '60210'">maximum flame height (cm)</xsl:when>
                    <xsl:when test="./i6:value = '60211'">flame duration (s)</xsl:when>
                    <xsl:when test="./i6:value = '60212'">ignition distance (cm)</xsl:when>
                    <xsl:when test="./i6:value = '60213'">time equivalent (s/m³)</xsl:when>
                    <xsl:when test="./i6:value = '60214'">deflagration density (g/m³)</xsl:when>
                    <xsl:when test="./i6:value = '60385'">no ignition</xsl:when>
                    <xsl:when test="./i6:value = '60108'">burning rate test: preliminary screening test</xsl:when>
                    <xsl:when test="./i6:value = '60109'">burning rate test over 100 mm length</xsl:when>
                    <xsl:when test="./i6:value = '60110'">burning rate test with wetted zone</xsl:when>
                    <xsl:when test="./i6:value = '60111'">burning time over 250 mm for metal powders or metal alloys</xsl:when>
                    <xsl:when test="./i6:value = '60112'">burning time (test type not further specified)</xsl:when>
                    <xsl:when test="./i6:value = '60113'">substance does not ignite and propagate combustion either by burning with flame or smouldering along 200 mm of the powder train within the 2 minutes test period</xsl:when>
                    <xsl:when test="./i6:value = '60114'">flame passes the wetted zone</xsl:when>
                    <xsl:when test="./i6:value = '60115'">wetted zone stops propagation of the flame for at least 4 minutes</xsl:when>
                    <xsl:when test="./i6:value = '1720'">ambiguous</xsl:when>
                    <xsl:when test="./i6:value = '60116'">ignition time on contact with air</xsl:when>
                    <xsl:when test="./i6:value = '60218'">ignition within 5 minutes</xsl:when>
                    <xsl:when test="./i6:value = '60219'">no ignition within 5 minutes</xsl:when>
                    <xsl:when test="./i6:value = '60220'">ignition (time span not specified)</xsl:when>
                    <xsl:when test="./i6:value = '60221'">ignition on contact with air (not further specified)</xsl:when>
                    <xsl:when test="./i6:value = '60222'">no ignition on contact with air (not further specified)</xsl:when>
                    <xsl:when test="./i6:value = '60215'">effect on filter paper</xsl:when>
                    <xsl:when test="./i6:value = '62009'">charring</xsl:when>
                    <xsl:when test="./i6:value = '62010'">no charring</xsl:when>
                    <xsl:when test="./i6:value = '60405'">25 mm sample cube at 140°C</xsl:when>
                    <xsl:when test="./i6:value = '60406'">100 mm sample cube at 140°C</xsl:when>
                    <xsl:when test="./i6:value = '60407'">100 mm sample cube at 120°C</xsl:when>
                    <xsl:when test="./i6:value = '60408'">100 mm sample cube at 100°C</xsl:when>
                    <xsl:when test="./i6:value = '60412'">positive outcome (effect observed)</xsl:when>
                    <xsl:when test="./i6:value = '60413'">negative outcome (no effect observed)</xsl:when>
                    <xsl:when test="./i6:value = '60426'">as specified:</xsl:when>
                    <xsl:when test="./i6:value = '60427'">unknown</xsl:when>
                    <xsl:when test="./i6:value = '60428'">not applicable as no gas evolved</xsl:when>
                    <xsl:when test="./i6:value = '60429'">vigorous reaction with water and spontaneous ignition of the evolved gas</xsl:when>
                    <xsl:when test="./i6:value = '60430'">easy reaction with water but no spontaneous ignition of the evolved gas</xsl:when>
                    <xsl:when test="./i6:value = '60431'">slow reaction with water but no spontaneous ignition of the evolved gas</xsl:when>
                    <xsl:when test="./i6:value = '60432'">reaction with water (not further specified)</xsl:when>
                    <xsl:when test="./i6:value = '60433'">no reaction with water observed</xsl:when>
                    <xsl:when test="./i6:value = '60434'">only step 4 of test procedure conducted because substance does not react violently with water</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                    <xsl:when test="./i6:value = '1815'">contact with water liberates highly flammable gases</xsl:when>
                    <xsl:when test="./i6:value = '1899'">extremely flammable</xsl:when>
                    <xsl:when test="./i6:value = '1900'">extremely flammable liquified gas</xsl:when>
                    <xsl:when test="./i6:value = '1913'">flammable</xsl:when>
                    <xsl:when test="./i6:value = '1970'">highly flammable</xsl:when>
                    <xsl:when test="./i6:value = '2187'">non flammable</xsl:when>
                    <xsl:when test="./i6:value = '2388'">spontaneously flammable in air (pyrophoric)</xsl:when>
                    <xsl:when test="./i6:value = '60599'">Category 1 (extremely flammable aerosols) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60600'">Category 1 (flammable gases) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60601'">Category 1 (flammable solids) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60602'">Category 1 (pyrophoric liquids) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60603'">Category 1 (pyrophoric solids) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60604'">Category 1 (self-heating substances and mixtures) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60605'">Category 1 (substances or mixtures which in contact with water release flammable gases which may ignite spontaneously) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60606'">Category 2 (flammable aerosols) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60607'">Category 2 (flammable gases) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60608'">Category 2 (flammable solids) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60609'">Category 2 (self-heating substances and mixtures) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60610'">Category 2 (substances or mixtures which in contact with water releases flammable gases) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60611'">Category 3 (non-flammable aerosols) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60612'">Category 3 (substances or mixtures which in contact with water releases flammable gases) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60613'">Category A (chemically unstable gases) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60614'">Category B (chemically unstable gases) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60366'">GHS criteria not met</xsl:when>
                    <xsl:when test="./i6:value = '60647'">not classified based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60364'">study cannot be used for classification</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:FlammableGasesLowerAndUpperExplosionLimit | //xt:Aerosols | //xt:FlammableSolids | //xt:PyrophoricSolids | //xt:PyrophoricLiquids | //xt:SelfHeatingSubstancesMixtures | //xt:SubstancesMixturesWhichInContactWithWaterEmitFlammableGases | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'FlammableGasesLowerAndUpperExplosionLimit'">Flammable gases (Lower and upper explosion limit)</xsl:when>
                    <xsl:when test="name(.) = 'PyrophoricLiquids'">Pyrophoric liquids</xsl:when>
                    <xsl:when test="name(.) = 'PyrophoricSolids'">Pyrophoric solids</xsl:when>
                    <xsl:when test="name(.) = 'Aerosols'">Aerosols</xsl:when>
                    <xsl:when test="name(.) = 'SelfHeatingSubstancesMixtures'">Self-heating substances / mixtures</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'FlammableSolids'">Flammable solids</xsl:when>
                    <xsl:when test="name(.) = 'AttachedJustification'">Attached justification</xsl:when>
                    <xsl:when test="name(.) = 'SubstancesMixturesWhichInContactWithWaterEmitFlammableGases'">Substances / mixtures which in contact with water emit flammable gases</xsl:when>
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
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
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
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:OtherInformation | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
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
