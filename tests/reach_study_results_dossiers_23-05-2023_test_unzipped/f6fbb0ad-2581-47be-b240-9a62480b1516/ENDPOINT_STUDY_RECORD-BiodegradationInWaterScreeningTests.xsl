<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-BiodegradationInWaterScreeningTests/7.0" version="1.0">
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
            <td>Biodegradation in water: screening tests</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS | //xt:KeyResult | //xt:KeyResult">
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
    <xsl:template match="//xt:StDev">
        <tr>
            <td class="label">St. dev.</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:SamplingTime">
        <tr>
            <td class="label">Sampling time</td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '2329'"> s</xsl:when>
                    <xsl:when test="./unitCode = '2113'"> min</xsl:when>
                    <xsl:when test="./unitCode = '1976'"> h</xsl:when>
                    <xsl:when test="./unitCode = '1839'"> d</xsl:when>
                    <xsl:when test="./unitCode = '2468'"> wk</xsl:when>
                    <xsl:when test="./unitCode = '2133'"> mo</xsl:when>
                    <xsl:when test="./unitCode = '2477'"> yr</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DurationOfTestContactTime | //xt:InitialConc | //xt:Degr | //xt:Value">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'InitialConc'">Initial conc.</xsl:when>
                    <xsl:when test="name(.) = 'Value'">Value</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfTestContactTime'">Duration of test (contact time)</xsl:when>
                    <xsl:when test="name(.) = 'Degr'">Value</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:choose>
                    <xsl:when test="./i6:unitCode = '2329'"> s</xsl:when>
                    <xsl:when test="./i6:unitCode = '2113'"> min</xsl:when>
                    <xsl:when test="./i6:unitCode = '1976'"> h</xsl:when>
                    <xsl:when test="./i6:unitCode = '1839'"> d</xsl:when>
                    <xsl:when test="./i6:unitCode = '2468'"> wk</xsl:when>
                    <xsl:when test="./i6:unitCode = '2133'"> mo</xsl:when>
                    <xsl:when test="./i6:unitCode = '2477'"> yr</xsl:when>
                    <xsl:when test="./i6:unitCode = '1935'"> g/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2098'"> mg/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2123'"> mmol/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2127'"> mol/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2500'"> µg/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2504'"> µmol/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '1342'"> other:</xsl:when>
                    <xsl:when test="./i6:unitCode = '1927'"> g O2/g test mat.</xsl:when>
                    <xsl:when test="./i6:unitCode = '2074'"> mg O2/g test mat.</xsl:when>
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
                    <xsl:when test="./i6:value = '60237'">the study does not need to be conducted because the substance is inorganic</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:OxygenConditions | //xt:InoculumOrTestSystem | //xt:BasedOn | //xt:ParameterFollowedForBiodegradationEstimation | //xt:ReferenceSubstance | //xt:Parameter | //xt:RemarksOnResults | //xt:Parameter | //xt:RemarksOnResults | //xt:Type | //xt:ValidityCriteriaFulfilled | //xt:InterpretationOfResults">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'OxygenConditions'">Oxygen conditions</xsl:when>
                    <xsl:when test="name(.) = 'InoculumOrTestSystem'">Inoculum or test system</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceSubstance'">Reference substance</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'ParameterFollowedForBiodegradationEstimation'">Parameter followed for biodegradation estimation</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'ValidityCriteriaFulfilled'">Validity criteria fulfilled</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Endpoint</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'BasedOn'">Based on</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'Parameter'">Parameter</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'InterpretationOfResults'">Interpretation of results</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60752'">biodegradation in water: ready biodegradability</xsl:when>
                    <xsl:when test="./i6:value = '60753'">biodegradation in water: inherent biodegradability</xsl:when>
                    <xsl:when test="./i6:value = '60754'">biodegradation in water: screening test, other</xsl:when>
                    <xsl:when test="./i6:value = '61929'">biodegradation in water: screening tests</xsl:when>
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
                    <xsl:when test="./i6:value = '1223'">OECD Guideline 301 A (old version) (Ready Biodegradability: Modified AFNOR Test)</xsl:when>
                    <xsl:when test="./i6:value = '1222'">OECD Guideline 301 A (Ready Biodegradability: DOC Die Away Test)</xsl:when>
                    <xsl:when test="./i6:value = '1224'">OECD Guideline 301 B (Ready Biodegradability: CO2 Evolution Test)</xsl:when>
                    <xsl:when test="./i6:value = '1225'">OECD Guideline 301 C (Ready Biodegradability: Modified MITI Test (I))</xsl:when>
                    <xsl:when test="./i6:value = '1226'">OECD Guideline 301 D (Ready Biodegradability: Closed Bottle Test)</xsl:when>
                    <xsl:when test="./i6:value = '1227'">OECD Guideline 301 E (Ready biodegradability: Modified OECD Screening Test)</xsl:when>
                    <xsl:when test="./i6:value = '1228'">OECD Guideline 301 F (Ready Biodegradability: Manometric Respirometry Test)</xsl:when>
                    <xsl:when test="./i6:value = '1229'">OECD Guideline 302 A (Inherent Biodegradability: Modified SCAS Test)</xsl:when>
                    <xsl:when test="./i6:value = '1230'">OECD Guideline 302 B (Inherent biodegradability: Zahn-Wellens/EMPA Test)</xsl:when>
                    <xsl:when test="./i6:value = '1231'">OECD Guideline 302 C (Inherent Biodegradability: Modified MITI Test (II))</xsl:when>
                    <xsl:when test="./i6:value = '1232'">OECD Guideline 302 D Draft (Inherent Biodegradability - Concawe Test)</xsl:when>
                    <xsl:when test="./i6:value = '1242'">OECD Guideline 306 (Biodegradability in Seawater)</xsl:when>
                    <xsl:when test="./i6:value = '1246'">OECD Guideline 310 (Ready Biodegradability - CO2 in Sealed Vessels (Headspace Test)</xsl:when>
                    <xsl:when test="./i6:value = '1247'">OECD Guideline 311 (Anaerobic Biodegradability of Organic Compounds in Digested Sludge: Measurement of Gas Production)</xsl:when>
                    <xsl:when test="./i6:value = '723'">EU Method C.4-A (Determination of the "Ready" Biodegradability - Dissolved Organic Carbon (DOC) Die-Away Test)</xsl:when>
                    <xsl:when test="./i6:value = '724'">EU Method C.4-B (Determination of the "Ready" Biodegradability - Modified OECD Screening Test)</xsl:when>
                    <xsl:when test="./i6:value = '725'">EU Method C.4-C (Determination of the "Ready" Biodegradability - Carbon Dioxide Evolution Test)</xsl:when>
                    <xsl:when test="./i6:value = '726'">EU Method C.4-D (Determination of the "Ready" Biodegradability - Manometric Respirometry Test)</xsl:when>
                    <xsl:when test="./i6:value = '727'">EU Method C.4-E (Determination of the "Ready" Biodegradability - Closed Bottle Test)</xsl:when>
                    <xsl:when test="./i6:value = '728'">EU Method C.4-F (Determination of the "Ready" Biodegradability - MITI Test)</xsl:when>
                    <xsl:when test="./i6:value = '729'">EU Method C.5 (Degradation: Biochemical Oxygen Demand)</xsl:when>
                    <xsl:when test="./i6:value = '730'">EU Method C.6 (Degradation: Chemical Oxygen Demand)</xsl:when>
                    <xsl:when test="./i6:value = '732'">EU Method C.9 (Biodegradation: Zahn-Wellens Test)</xsl:when>
                    <xsl:when test="./i6:value = '709'">EU Method C.12 (Biodegradation: Modified SCAS Test)</xsl:when>
                    <xsl:when test="./i6:value = '60756'">EU Method C.29 (Ready Biodegradability - CO2 in Sealed Vessels (Headspace Test))</xsl:when>
                    <xsl:when test="./i6:value = '441'">EPA OPPTS 835.3100 (Aerobic Aquatic Biodegradation)</xsl:when>
                    <xsl:when test="./i6:value = '442'">EPA OPPTS 835.3110 (Ready Biodegradability)</xsl:when>
                    <xsl:when test="./i6:value = '443'">EPA OPPTS 835.3120 (Sealed Vessel Carbon Dioxide Production Test)</xsl:when>
                    <xsl:when test="./i6:value = '60758'">EPA OPPTS 835.3140 - Ready Biodegradability – CO2 in Sealed Vessels (Headspace Test)</xsl:when>
                    <xsl:when test="./i6:value = '444'">EPA OPPTS 835.3170 (Shake Flask Die-away Test)</xsl:when>
                    <xsl:when test="./i6:value = '446'">EPA OPPTS 835.3200 (Zahn-Wellens / EMPA Test)</xsl:when>
                    <xsl:when test="./i6:value = '447'">EPA OPPTS 835.3210 (Inherent Biodegradability: Modified SCAS Test)</xsl:when>
                    <xsl:when test="./i6:value = '60757'">EPA OPPTS 835.3215 (Inherent Biodegradability - Concawe Test)</xsl:when>
                    <xsl:when test="./i6:value = '450'">EPA OPPTS 835.3400 (Anaerobic Biodegradability of Organic Chemicals)</xsl:when>
                    <xsl:when test="./i6:value = '60759'">EPA OPPTS 835.3420 (Anaerobic Biodegradability of Organic Compounds in Digested Sludge: By Measurement of Gas Production)</xsl:when>
                    <xsl:when test="./i6:value = '452'">EPA OPPTS 835.5045 (Modified SCAS Test for Insoluble and Volatile Chemicals)</xsl:when>
                    <xsl:when test="./i6:value = '555'">EPA OTS 795.45 (Inherent Biodegradability: Modified SCAS Test for Chemical Substances that are Water Insoluble or Water Insoluble and Volatile)</xsl:when>
                    <xsl:when test="./i6:value = '560'">EPA OTS 796.3100 (Aerobic Aquatic Biodegradation)</xsl:when>
                    <xsl:when test="./i6:value = '561'">EPA OTS 796.3140 (Anaerobic Biodegradability of Organic Chemicals)</xsl:when>
                    <xsl:when test="./i6:value = '562'">EPA OTS 796.3180 (Ready Biodegradability: Modified AFNOR Test)</xsl:when>
                    <xsl:when test="./i6:value = '563'">EPA OTS 796.3200 (Ready Biodegradability: Closed Bottle Test)</xsl:when>
                    <xsl:when test="./i6:value = '564'">EPA OTS 796.3220 (Ready Biodegradability: Modified MITI Test(I))</xsl:when>
                    <xsl:when test="./i6:value = '565'">EPA OTS 796.3240 (Ready Biodegradability: Modified OECD Screening Test)</xsl:when>
                    <xsl:when test="./i6:value = '566'">EPA OTS 796.3260 (Ready Biodegradability: Modified Sturm Test)</xsl:when>
                    <xsl:when test="./i6:value = '567'">EPA OTS 796.3340 (Inherent Biodegradability: Modified SCAS Test)</xsl:when>
                    <xsl:when test="./i6:value = '568'">EPA OTS 796.3360 (Inherent Biodegradability: Modified Zahn-Wellens Test)</xsl:when>
                    <xsl:when test="./i6:value = '367'">ECETOC Anaerobic Biodegradation (Technical Report No. 28)</xsl:when>
                    <xsl:when test="./i6:value = '868'">ISO 5815 (Water quality - Determination of Biochemical Oxygen Demand after 5 Days (BOD5) - Dilution and Seeding Method)</xsl:when>
                    <xsl:when test="./i6:value = '874'">ISO 7827 (Evaluation in an Aqueous Medium of the "Ultimate" Aerobic Biodegradability of Organic Compounds - Method by Analysis of Dissolved Organic Carbon (DOC))</xsl:when>
                    <xsl:when test="./i6:value = '878'">ISO DIS 9439 (Ultimate Aerobic Biodegradability - Method by Analysis of Released Carbon Dioxide)</xsl:when>
                    <xsl:when test="./i6:value = '881'">ISO Draft (BOD Test for Insoluble Substances)</xsl:when>
                    <xsl:when test="./i6:value = '60760'">ISO 9887 Water quality - Evaluation of the aerobic biodegradability of organic compounds in an aqueous medium - Semi-continuous activated sludge method (SCAS)</xsl:when>
                    <xsl:when test="./i6:value = '60761'">ISO 9888 Water quality - Evaluation of ultimate aerobic biodegradability of organic compounds in aqueous medium - Static test (Zahn-Wellens method)</xsl:when>
                    <xsl:when test="./i6:value = '60762'">ISO 10707 Water quality - Evaluation in an aqueous medium of the "ultimate" aerobic biodegradability of organic compounds - Method by analysis of biochemical oxygen demand (closed bottle test)</xsl:when>
                    <xsl:when test="./i6:value = '60763'">ISO 10708 Water quality - Evaluation in an aqueous medium of the ultimate aerobic biodegradability of organic compounds - Determination of biochemical oxygen demand in a two-phase closed bottle test</xsl:when>
                    <xsl:when test="./i6:value = '60764'">ISO 11734 Water quality - Evaluation of the "ultimate" anaerobic biodegradability of organic compounds in digested sludge - Method by measurement of the biogas production</xsl:when>
                    <xsl:when test="./i6:value = '60765'">ISO 14593:1999 (Water quality - Evaluation of ultimate aerobic biodegradability of organic compounds in aqueous medium - Method by analysis of inorganic carbon in sealed vessels (CO2 headspace test))</xsl:when>
                    <xsl:when test="./i6:value = '880'">ISO DP 6060 (Water Quality - Determination of the Chemical Oxygen Demand)</xsl:when>
                    <xsl:when test="./i6:value = '877'">ISO DIS 9408 (Ultimate Aerobic Biodegradability - Method by Determining the Oxygen Demand in a Closed Respirometer)</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '1708'">aerobic</xsl:when>
                    <xsl:when test="./i6:value = '1723'">anaerobic</xsl:when>
                    <xsl:when test="./i6:value = '1710'">aerobic/anaerobic</xsl:when>
                    <xsl:when test="./i6:value = '4464'">activated sludge (adaptation not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3455'">activated sludge, adapted</xsl:when>
                    <xsl:when test="./i6:value = '3462'">activated sludge, non-adapted</xsl:when>
                    <xsl:when test="./i6:value = '3456'">activated sludge, domestic (adaptation not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3457'">activated sludge, domestic, adapted</xsl:when>
                    <xsl:when test="./i6:value = '3458'">activated sludge, domestic, non-adapted</xsl:when>
                    <xsl:when test="./i6:value = '3459'">activated sludge, industrial (adaptation not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3460'">activated sludge, industrial, adapted</xsl:when>
                    <xsl:when test="./i6:value = '3461'">activated sludge, industrial, non-adapted</xsl:when>
                    <xsl:when test="./i6:value = '3578'">sewage, domestic (adaptation not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3579'">sewage, domestic, adapted</xsl:when>
                    <xsl:when test="./i6:value = '3580'">sewage, domestic, non-adapted</xsl:when>
                    <xsl:when test="./i6:value = '3581'">sewage, industrial (adaptation not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3582'">sewage, industrial, adapted</xsl:when>
                    <xsl:when test="./i6:value = '3583'">sewage, industrial, non-adapted</xsl:when>
                    <xsl:when test="./i6:value = '3584'">sewage, predominantly domestic (adaptation not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3577'">sewage, predominantly domestic, adapted</xsl:when>
                    <xsl:when test="./i6:value = '3585'">sewage, predominantly domestic, non-adapted</xsl:when>
                    <xsl:when test="./i6:value = '3586'">sewage, predominantly industrial (adaptation not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3587'">sewage, predominantly industrial, adapted</xsl:when>
                    <xsl:when test="./i6:value = '3588'">sewage, predominantly industrial, non-adapted</xsl:when>
                    <xsl:when test="./i6:value = '3465'">anaerobic sludge</xsl:when>
                    <xsl:when test="./i6:value = '3466'">digested sludge</xsl:when>
                    <xsl:when test="./i6:value = '3463'">anaerobic bacteria</xsl:when>
                    <xsl:when test="./i6:value = '3464'">anaerobic microorganisms</xsl:when>
                    <xsl:when test="./i6:value = '60738'">natural water: freshwater</xsl:when>
                    <xsl:when test="./i6:value = '60739'">natural water: marine</xsl:when>
                    <xsl:when test="./i6:value = '60740'">natural water: brackish</xsl:when>
                    <xsl:when test="./i6:value = '3528'">natural water</xsl:when>
                    <xsl:when test="./i6:value = '62039'">water (not specified)</xsl:when>
                    <xsl:when test="./i6:value = '60741'">natural water / sediment: freshwater</xsl:when>
                    <xsl:when test="./i6:value = '60742'">natural water / sediment: marine</xsl:when>
                    <xsl:when test="./i6:value = '60743'">natural water / sediment: brackish</xsl:when>
                    <xsl:when test="./i6:value = '3529'">natural water / sediment</xsl:when>
                    <xsl:when test="./i6:value = '60744'">natural sediment: freshwater</xsl:when>
                    <xsl:when test="./i6:value = '60745'">natural sediment: marine</xsl:when>
                    <xsl:when test="./i6:value = '60746'">natural sediment: brackish</xsl:when>
                    <xsl:when test="./i6:value = '3526'">natural sediment</xsl:when>
                    <xsl:when test="./i6:value = '1737'">artificial sediment</xsl:when>
                    <xsl:when test="./i6:value = '62038'">sediment (not specified)</xsl:when>
                    <xsl:when test="./i6:value = '3527'">natural soil</xsl:when>
                    <xsl:when test="./i6:value = '3525'">mixture of sewage, soil and natural water</xsl:when>
                    <xsl:when test="./i6:value = '197'">COD</xsl:when>
                    <xsl:when test="./i6:value = '320'">DOC</xsl:when>
                    <xsl:when test="./i6:value = '60779'">IC (inorganic carbon)</xsl:when>
                    <xsl:when test="./i6:value = '60780'">ThCO2</xsl:when>
                    <xsl:when test="./i6:value = '60781'">ThOD</xsl:when>
                    <xsl:when test="./i6:value = '1607'">ThOD/L</xsl:when>
                    <xsl:when test="./i6:value = '1606'">ThIC</xsl:when>
                    <xsl:when test="./i6:value = '60782'">TOC</xsl:when>
                    <xsl:when test="./i6:value = '1758'">test mat.</xsl:when>
                    <xsl:when test="./i6:value = '1754'">act. ingr.</xsl:when>
                    <xsl:when test="./i6:value = '1919'">formulation</xsl:when>
                    <xsl:when test="./i6:value = '60790'">probability of ready biodegradability (QSAR/QSPR)</xsl:when>
                    <xsl:when test="./i6:value = '60791'">calculated rating of total degradation time (QSAR/QSPR)</xsl:when>
                    <xsl:when test="./i6:value = '60792'">half-life in days (QSAR/QSPR)</xsl:when>
                    <xsl:when test="./i6:value = '193'">CH4 evolution</xsl:when>
                    <xsl:when test="./i6:value = '196'">CO2 evolution</xsl:when>
                    <xsl:when test="./i6:value = '321'">DOC removal</xsl:when>
                    <xsl:when test="./i6:value = '906'">inorg. C analysis</xsl:when>
                    <xsl:when test="./i6:value = '1181'">O2 consumption</xsl:when>
                    <xsl:when test="./i6:value = '1445'">radiochem. meas.</xsl:when>
                    <xsl:when test="./i6:value = '1605'">test mat. analysis</xsl:when>
                    <xsl:when test="./i6:value = '1599'">TOC removal</xsl:when>
                    <xsl:when test="./i6:value = '1732'">aniline</xsl:when>
                    <xsl:when test="./i6:value = '1764'">benzoic acid, sodium salt</xsl:when>
                    <xsl:when test="./i6:value = '1681'">acetic acid, sodium salt</xsl:when>
                    <xsl:when test="./i6:value = '1889'">ethylene glycol</xsl:when>
                    <xsl:when test="./i6:value = '1850'">diethylene glycol</xsl:when>
                    <xsl:when test="./i6:value = '2029'">laurylsulfonate</xsl:when>
                    <xsl:when test="./i6:value = '2203'">not required</xsl:when>
                    <xsl:when test="./i6:value = '60804'">% degradation (CH4 evolution)</xsl:when>
                    <xsl:when test="./i6:value = '60805'">% degradation (CO2 evolution)</xsl:when>
                    <xsl:when test="./i6:value = '60806'">% degradation (DOC removal)</xsl:when>
                    <xsl:when test="./i6:value = '60807'">% degradation (inorg. C analysis)</xsl:when>
                    <xsl:when test="./i6:value = '60808'">% degradation (O2 consumption)</xsl:when>
                    <xsl:when test="./i6:value = '60809'">% degradation (radiochem. meas.)</xsl:when>
                    <xsl:when test="./i6:value = '60810'">% degradation (test mat. analysis)</xsl:when>
                    <xsl:when test="./i6:value = '60811'">% degradation (TOC removal)</xsl:when>
                    <xsl:when test="./i6:value = '60794'">readily biodegradable based on QSAR/QSPR prediction</xsl:when>
                    <xsl:when test="./i6:value = '60795'">not readily biodegradable based on QSAR/QSPR prediction</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '128'">BOD5</xsl:when>
                    <xsl:when test="./i6:value = '1478'">BOD5*100/COD</xsl:when>
                    <xsl:when test="./i6:value = '60796'">BOD5*100/ThOD</xsl:when>
                    <xsl:when test="./i6:value = '58576'">BOD5/COD ratio</xsl:when>
                    <xsl:when test="./i6:value = '58677'">BOD5/ThOD ratio</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                    <xsl:when test="./i6:value = '2438'">under test conditions no biodegradation observed</xsl:when>
                    <xsl:when test="./i6:value = '60797'">not readily biodegradable</xsl:when>
                    <xsl:when test="./i6:value = '2305'">readily biodegradable</xsl:when>
                    <xsl:when test="./i6:value = '2306'">readily biodegradable, but failing 10-day window</xsl:when>
                    <xsl:when test="./i6:value = '1997'">inherently biodegradable</xsl:when>
                    <xsl:when test="./i6:value = '1998'">inherently biodegradable, fulfilling specific criteria</xsl:when>
                    <xsl:when test="./i6:value = '1999'">inherently biodegradable, not fulfilling specific criteria</xsl:when>
                    <xsl:when test="./i6:value = '2199'">not inherently biodegradable</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:InitialTestSubstanceConcentration | //xt:ParameterFollowedForBiodegradationEstimation | //xt:ReferenceSubstance | //xt:Degradation | //xt:Bod5Cod | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'Degradation'">% Degradation</xsl:when>
                    <xsl:when test="name(.) = 'Bod5Cod'">BOD5 / COD</xsl:when>
                    <xsl:when test="name(.) = 'InitialTestSubstanceConcentration'">Initial test substance concentration</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceSubstance'">Reference substance</xsl:when>
                    <xsl:when test="name(.) = 'CrossReference'">Cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Test guideline</xsl:when>
                    <xsl:when test="name(.) = 'ParameterFollowedForBiodegradationEstimation'">Parameter followed for biodegradation estimation</xsl:when>
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
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:StudyDesign | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:Bod5CodResults | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'Bod5CodResults'">BOD5 / COD results</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
                    <xsl:when test="name(.) = 'StudyDesign'">Study design</xsl:when>
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
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:DetailsOnInoculum | //xt:DetailsOnAnalyticalMethods | //xt:DetailsOnStudyDesign | //xt:OtherInformation | //xt:PrelimStudyRs | //xt:TestPerformance | //xt:ResultsDetails | //xt:ResultsWithReferenceSubstance | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'DetailsOnAnalyticalMethods'">Details on analytical methods</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnStudyDesign'">Details on study design</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'ResultsDetails'">Details on results</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'PrelimStudyRs'">Preliminary study</xsl:when>
                    <xsl:when test="name(.) = 'ResultsWithReferenceSubstance'">Results with reference substance</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'TestPerformance'">Test performance</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnInoculum'">Details on inoculum</xsl:when>
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
