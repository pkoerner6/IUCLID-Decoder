<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-SkinIrritationCorrosion/7.0" version="1.0">
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
            <td>Skin irritation / corrosion</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:RobustStudy | //xt:UsedForClassification | //xt:UsedForMSDS">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'RobustStudy'">Robust study summary</xsl:when>
                    <xsl:when test="name(.) = 'UsedForMSDS'">Used for SDS</xsl:when>
                    <xsl:when test="name(.) = 'UsedForClassification'">Used for classification</xsl:when>
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
    <xsl:template match="//xt:Scale">
        <tr>
            <td class="label">Max. score</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Value | //xt:Score">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'Score'">Score</xsl:when>
                    <xsl:when test="name(.) = 'Value'">Value</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:value-of select="./i6:unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataWaivingJustification | //xt:ControlSamples | //xt:Controls">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'DataWaivingJustification'">Justification for data waiving</xsl:when>
                    <xsl:when test="name(.) = 'Controls'">Controls</xsl:when>
                    <xsl:when test="name(.) = 'ControlSamples'">Control samples</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60868'">the study need not be conducted because the available information indicates that the criteria are met for classification as corrosive to the skin or irritating to eyes</xsl:when>
                    <xsl:when test="./i6:value = '60869'">the study does not need to be conducted because the substance is spontaneously flammable in air or in contact with water or moisture at room temperature</xsl:when>
                    <xsl:when test="./i6:value = '60870'">the study does not need to be conducted because the substance is classified as acute toxicity by the dermal route (Category 1)</xsl:when>
                    <xsl:when test="./i6:value = '60871'">the study does not need to be conducted because an acute toxicity study by the dermal route does not indicate skin irritation up to the relevant limit dose level (2 000 mg/kg body weight)</xsl:when>
                    <xsl:when test="./i6:value = '60872'">the study need not be conducted because the substance is a strong acid (pH &lt;= 2.0) or base (pH =&gt; 11.5)</xsl:when>
                    <xsl:when test="./i6:value = '62393'">the study does not need to be conducted because the substance is a strong acid (pH ≤ 2.0) or base (pH ≥ 11.5) and the available information indicates that it should be classified as skin corrosion (Category 1, 1A, 1B or 1C)</xsl:when>
                    <xsl:when test="./i6:value = '62394'">an in vitro skin irritation study does not need to be conducted because the available in vitro test methods are not applicable for the substance and therefore an in vivo skin irritation study was conducted</xsl:when>
                    <xsl:when test="./i6:value = '61994'">an in vitro skin irritation study does not need to be conducted because adequate data from an in vivo skin irritation study are available</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '2203'">not required</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '2207'">not specified</xsl:when>
                    <xsl:when test="./i6:value = '62147'">yes, concurrent negative control</xsl:when>
                    <xsl:when test="./i6:value = '2482'">yes, concurrent no treatment</xsl:when>
                    <xsl:when test="./i6:value = '2483'">yes, concurrent vehicle</xsl:when>
                    <xsl:when test="./i6:value = '62148'">yes, concurrent positive control</xsl:when>
                    <xsl:when test="./i6:value = '62150'">yes, concurrent MTT non-specific colour control</xsl:when>
                    <xsl:when test="./i6:value = '2480'">yes</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:TestSystem | //xt:SourceSpecies | //xt:CellType | //xt:CellSource | //xt:SourceStrain | //xt:Vehicle | //xt:Species | //xt:Strain | //xt:TypeOfCoverage | //xt:PreparationOfTestSite | //xt:Vehicle | //xt:IrritationCorrosionParameter | //xt:VehicleControlsValid | //xt:NegativeControlsValid | //xt:PositiveControlsValid | //xt:RemarksOnResults | //xt:Parameter | //xt:Basis | //xt:TimePoint | //xt:Reversibility | //xt:RemarksOnResults | //xt:Type | //xt:InterpretationOfResults">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'PositiveControlsValid'">Positive controls validity</xsl:when>
                    <xsl:when test="name(.) = 'SourceSpecies'">Source species</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'Vehicle'">Vehicle</xsl:when>
                    <xsl:when test="name(.) = 'Basis'">Basis</xsl:when>
                    <xsl:when test="name(.) = 'PreparationOfTestSite'">Preparation of test site</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Endpoint</xsl:when>
                    <xsl:when test="name(.) = 'TestSystem'">Test system</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'Species'">Species</xsl:when>
                    <xsl:when test="name(.) = 'InterpretationOfResults'">Interpretation of results</xsl:when>
                    <xsl:when test="name(.) = 'SourceStrain'">Source strain</xsl:when>
                    <xsl:when test="name(.) = 'TypeOfCoverage'">Type of coverage</xsl:when>
                    <xsl:when test="name(.) = 'NegativeControlsValid'">Negative controls validity</xsl:when>
                    <xsl:when test="name(.) = 'TimePoint'">Time point</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'Strain'">Strain</xsl:when>
                    <xsl:when test="name(.) = 'CellSource'">Cell source</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'CellType'">Cell type</xsl:when>
                    <xsl:when test="name(.) = 'Parameter'">Irritation parameter</xsl:when>
                    <xsl:when test="name(.) = 'Reversibility'">Reversibility</xsl:when>
                    <xsl:when test="name(.) = 'VehicleControlsValid'">Vehicle controls validity</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                    <xsl:when test="name(.) = 'IrritationCorrosionParameter'">Irritation / corrosion parameter</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '60864'">skin corrosion: in vitro / ex vivo</xsl:when>
                    <xsl:when test="./i6:value = '60865'">skin irritation: in vitro / ex vivo</xsl:when>
                    <xsl:when test="./i6:value = '60866'">skin irritation: in vivo</xsl:when>
                    <xsl:when test="./i6:value = '60867'">skin irritation / corrosion, other</xsl:when>
                    <xsl:when test="./i6:value = '61970'">skin irritation / corrosion</xsl:when>
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
                    <xsl:when test="./i6:value = '1252'">OECD Guideline 404 (Acute Dermal Irritation / Corrosion)</xsl:when>
                    <xsl:when test="./i6:value = '9157'">OECD Guideline 430 (In Vitro Skin Corrosion: Transcutaneous Electrical Resistance Test Method (TER))</xsl:when>
                    <xsl:when test="./i6:value = '9158'">OECD Guideline 431 (In Vitro Skin Corrosion: Human Skin Model Test)</xsl:when>
                    <xsl:when test="./i6:value = '62180'">OECD Guideline 431 (In Vitro Skin Corrosion: Reconstructed Human Epidermis (RHE) Test Method)</xsl:when>
                    <xsl:when test="./i6:value = '1280'">OECD Guideline 435 (In Vitro Membrane Barrier Test Method for Skin Corrosion)</xsl:when>
                    <xsl:when test="./i6:value = '9159'">OECD Guideline 439 (In Vitro Skin Irritation: Reconstructed Human Epidermis Test Method)</xsl:when>
                    <xsl:when test="./i6:value = '697'">EU Method B.4 (Acute Toxicity: Dermal Irritation / Corrosion)</xsl:when>
                    <xsl:when test="./i6:value = '698'">EU Method B.40 (In Vitro Skin Corrosion: Transcutaneous Electrical Resistance Test (TER))</xsl:when>
                    <xsl:when test="./i6:value = '9156'">EU Method B.46 (In Vitro Skin Irritation: Reconstructed Human Epidermis Model Test)</xsl:when>
                    <xsl:when test="./i6:value = '409'">EPA OPP 81-5 (Acute Dermal Irritation)</xsl:when>
                    <xsl:when test="./i6:value = '505'">EPA OPPTS 870.2500 (Acute Dermal Irritation)</xsl:when>
                    <xsl:when test="./i6:value = '610'">EPA OTS 798.4470 (Acute Dermal Irritation)</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '62142'">human skin model</xsl:when>
                    <xsl:when test="./i6:value = '62143'">artificial membrane barrier model</xsl:when>
                    <xsl:when test="./i6:value = '62145'">isolated skin discs</xsl:when>
                    <xsl:when test="./i6:value = '2301'">rabbit</xsl:when>
                    <xsl:when test="./i6:value = '1952'">guinea pig</xsl:when>
                    <xsl:when test="./i6:value = '1956'">hamster</xsl:when>
                    <xsl:when test="./i6:value = '1957'">hamster, Armenian</xsl:when>
                    <xsl:when test="./i6:value = '1958'">hamster, Chinese</xsl:when>
                    <xsl:when test="./i6:value = '1959'">hamster, Syrian</xsl:when>
                    <xsl:when test="./i6:value = '2130'">monkey</xsl:when>
                    <xsl:when test="./i6:value = '4828'">human</xsl:when>
                    <xsl:when test="./i6:value = '2137'">mouse</xsl:when>
                    <xsl:when test="./i6:value = '2270'">pig</xsl:when>
                    <xsl:when test="./i6:value = '2302'">rat</xsl:when>
                    <xsl:when test="./i6:value = '62146'">non-transformed keratinocytes</xsl:when>
                    <xsl:when test="./i6:value = '62151'">foreskin from a single donor</xsl:when>
                    <xsl:when test="./i6:value = '62152'">foreskin from multiple donors</xsl:when>
                    <xsl:when test="./i6:value = '62153'">skin obtained from plastic surgery from a single donor</xsl:when>
                    <xsl:when test="./i6:value = '62154'">skin obtained from plastic surgery from multiple donors</xsl:when>
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
                    <xsl:when test="./i6:value = '2437'">unchanged (no vehicle)</xsl:when>
                    <xsl:when test="./i6:value = '2267'">physiological saline</xsl:when>
                    <xsl:when test="./i6:value = '1659'">water</xsl:when>
                    <xsl:when test="./i6:value = '62160'">Hank's balanced salt solution</xsl:when>
                    <xsl:when test="./i6:value = '3484'">rabbit</xsl:when>
                    <xsl:when test="./i6:value = '3534'">guinea pig</xsl:when>
                    <xsl:when test="./i6:value = '3535'">hamster</xsl:when>
                    <xsl:when test="./i6:value = '3536'">hamster, Armenian</xsl:when>
                    <xsl:when test="./i6:value = '3537'">hamster, Chinese</xsl:when>
                    <xsl:when test="./i6:value = '3538'">hamster, Syrian</xsl:when>
                    <xsl:when test="./i6:value = '3542'">monkey</xsl:when>
                    <xsl:when test="./i6:value = '3540'">human</xsl:when>
                    <xsl:when test="./i6:value = '3543'">mouse</xsl:when>
                    <xsl:when test="./i6:value = '3545'">pig</xsl:when>
                    <xsl:when test="./i6:value = '4196'">rat</xsl:when>
                    <xsl:when test="./i6:value = '2212'">occlusive</xsl:when>
                    <xsl:when test="./i6:value = '2340'">semiocclusive</xsl:when>
                    <xsl:when test="./i6:value = '2223'">open</xsl:when>
                    <xsl:when test="./i6:value = '129826'">unoccluded</xsl:when>
                    <xsl:when test="./i6:value = '1675'">abraded</xsl:when>
                    <xsl:when test="./i6:value = '2355'">shaved</xsl:when>
                    <xsl:when test="./i6:value = '9160'">clipped</xsl:when>
                    <xsl:when test="./i6:value = '60896'">% tissue viability</xsl:when>
                    <xsl:when test="./i6:value = '60897'">transcutaneous electrical resistance (in kΩ)</xsl:when>
                    <xsl:when test="./i6:value = '60898'">dye content (µg/disc)</xsl:when>
                    <xsl:when test="./i6:value = '60899'">penetration time (in minutes)</xsl:when>
                    <xsl:when test="./i6:value = '64853'">valid</xsl:when>
                    <xsl:when test="./i6:value = '64854'">not valid</xsl:when>
                    <xsl:when test="./i6:value = '2197'">not examined</xsl:when>
                    <xsl:when test="./i6:value = '60900'">no indication of irritation</xsl:when>
                    <xsl:when test="./i6:value = '60901'">positive indication of irritation</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '4143'">erythema score</xsl:when>
                    <xsl:when test="./i6:value = '4144'">edema score</xsl:when>
                    <xsl:when test="./i6:value = '4141'">overall irritation score</xsl:when>
                    <xsl:when test="./i6:value = '4142'">primary dermal irritation index (PDII)</xsl:when>
                    <xsl:when test="./i6:value = '2491'">animal #1</xsl:when>
                    <xsl:when test="./i6:value = '2487'">animal #2</xsl:when>
                    <xsl:when test="./i6:value = '2510'">animal #3</xsl:when>
                    <xsl:when test="./i6:value = '2411'">animal #4</xsl:when>
                    <xsl:when test="./i6:value = '2458'">animal #5</xsl:when>
                    <xsl:when test="./i6:value = '2479'">animal #6</xsl:when>
                    <xsl:when test="./i6:value = '2517'">animal:</xsl:when>
                    <xsl:when test="./i6:value = '2490'">mean</xsl:when>
                    <xsl:when test="./i6:value = '60906'">24 h</xsl:when>
                    <xsl:when test="./i6:value = '60907'">48 h</xsl:when>
                    <xsl:when test="./i6:value = '60908'">72 h</xsl:when>
                    <xsl:when test="./i6:value = '60909'">24/48 h</xsl:when>
                    <xsl:when test="./i6:value = '60910'">24/48/72 h</xsl:when>
                    <xsl:when test="./i6:value = '60903'">7 d</xsl:when>
                    <xsl:when test="./i6:value = '60904'">10 d</xsl:when>
                    <xsl:when test="./i6:value = '60905'">14 d</xsl:when>
                    <xsl:when test="./i6:value = '61888'">21 d</xsl:when>
                    <xsl:when test="./i6:value = '1923'">fully reversible within:</xsl:when>
                    <xsl:when test="./i6:value = '4105'">fully reversible</xsl:when>
                    <xsl:when test="./i6:value = '2198'">not fully reversible within:</xsl:when>
                    <xsl:when test="./i6:value = '2204'">not reversible</xsl:when>
                    <xsl:when test="./i6:value = '60912'">probability of weak irritation</xsl:when>
                    <xsl:when test="./i6:value = '60913'">probability of mild irritation</xsl:when>
                    <xsl:when test="./i6:value = '60914'">probability of moderate irritation</xsl:when>
                    <xsl:when test="./i6:value = '60915'">probability of severe irritation</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                    <xsl:when test="./i6:value = '60916'">Category 1 (corrosive) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60917'">Category 1A (corrosive) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60918'">Category 1B (corrosive) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60919'">Category 1C (corrosive) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60920'">Category 2 (irritant) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60921'">Category 3 (mild irritant) based on GHS criteria</xsl:when>
                    <xsl:when test="./i6:value = '60364'">study cannot be used for classification</xsl:when>
                    <xsl:when test="./i6:value = '60922'">GHS criteria not met</xsl:when>
                    <xsl:when test="./i6:value = '2200'">not irritating</xsl:when>
                    <xsl:when test="./i6:value = '2016'">irritating</xsl:when>
                    <xsl:when test="./i6:value = '2371'">slightly irritating</xsl:when>
                    <xsl:when test="./i6:value = '2124'">moderately irritating</xsl:when>
                    <xsl:when test="./i6:value = '1971'">highly irritating</xsl:when>
                    <xsl:when test="./i6:value = '1820'">corrosive</xsl:when>
                    <xsl:when test="./i6:value = '1969'">highly corrosive</xsl:when>
                    <xsl:when test="./i6:value = '218'">Category 1 (corrosive)</xsl:when>
                    <xsl:when test="./i6:value = '220'">Category 1A (corrosive)</xsl:when>
                    <xsl:when test="./i6:value = '221'">Category 1B (corrosive)</xsl:when>
                    <xsl:when test="./i6:value = '222'">Category 1C (corrosive)</xsl:when>
                    <xsl:when test="./i6:value = '223'">Category 2 (irritant)</xsl:when>
                    <xsl:when test="./i6:value = '226'">Category 3 (mild irritant)</xsl:when>
                    <xsl:when test="./i6:value = '227'">Category I</xsl:when>
                    <xsl:when test="./i6:value = '228'">Category II</xsl:when>
                    <xsl:when test="./i6:value = '229'">Category III</xsl:when>
                    <xsl:when test="./i6:value = '230'">Category IV</xsl:when>
                    <xsl:when test="./i6:value = '2195'">not classified</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:Results | //xt:Results | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'Results'">Results</xsl:when>
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
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:InVitroTestSystem | //xt:TestAnimals | //xt:TestSystem | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:InVitro | //xt:InVivo | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'TestAnimals'">Test animals</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
                    <xsl:when test="name(.) = 'InVitro'">In vitro</xsl:when>
                    <xsl:when test="name(.) = 'TestSystem'">Test system</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
                    <xsl:when test="name(.) = 'InVitroTestSystem'">In vitro test system</xsl:when>
                    <xsl:when test="name(.) = 'InVivo'">In vivo</xsl:when>
                    <xsl:when test="name(.) = 'MaterialsAndMethods'">Materials and methods</xsl:when>
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
    <xsl:template match="//xt:NumberOfReplicates | //xt:NumberOfAnimals">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'NumberOfReplicates'">Number of replicates</xsl:when>
                    <xsl:when test="name(.) = 'NumberOfAnimals'">Number of animals</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:DetailsOnAnimalUsedAsSourceOfTestSystem | //xt:JustificationForTestSystemUsed | //xt:DetailsOnTestSystem | //xt:AmountConcentrationApplied | //xt:DurationOfTreatmentExposure | //xt:DurationOfPostTreatmentIncubationIfApplicable | //xt:OrganismDetails | //xt:AmountConcentrationApplied | //xt:DurationOfTreatmentExposure | //xt:ObservationPeriod | //xt:DetailsOnStudyDesign | //xt:OtherInformation | //xt:RunExperiment | //xt:OtherEffectsAcceptanceOfResults | //xt:IrritationCorrosionResponseData | //xt:OtherEffects | //xt:OtherInformation | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'IrritationCorrosionResponseData'">Irritant / corrosive response data</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnAnimalUsedAsSourceOfTestSystem'">Details on animal used as source of test system</xsl:when>
                    <xsl:when test="name(.) = 'RunExperiment'">Run / experiment</xsl:when>
                    <xsl:when test="name(.) = 'OrganismDetails'">Details on test animals or test system and environmental conditions</xsl:when>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'OtherEffects'">Other effects</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnTestSystem'">Details on test system</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnStudyDesign'">Details on study design</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTestSystemUsed'">Justification for test system used</xsl:when>
                    <xsl:when test="name(.) = 'ObservationPeriod'">Observation period</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'OtherEffectsAcceptanceOfResults'">Other effects / acceptance of results</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfPostTreatmentIncubationIfApplicable'">Duration of post-treatment incubation (if applicable)</xsl:when>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'DurationOfTreatmentExposure'">Duration of treatment / exposure</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'AmountConcentrationApplied'">Amount / concentration applied</xsl:when>
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
