<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_STUDY_RECORD-ShortTermToxicityToFish/7.0" version="1.0">
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
            <td>Short-term toxicity to fish</td>
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
    <xsl:template match="//xt:TotalExposureDuration | //xt:Duration">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'TotalExposureDuration'">Total exposure duration</xsl:when>
                    <xsl:when test="name(.) = 'Duration'">Duration</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '2113'"> min</xsl:when>
                    <xsl:when test="./unitCode = '1976'"> h</xsl:when>
                    <xsl:when test="./unitCode = '1839'"> d</xsl:when>
                    <xsl:when test="./unitCode = '2468'"> wk</xsl:when>
                    <xsl:when test="./unitCode = '2133'"> mo</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:EffectConc | //xt:ConfInterval">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'EffectConc'">Effect conc.</xsl:when>
                    <xsl:when test="name(.) = 'ConfInterval'">95% CI</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./i6:lowerQualifier "/>
                <xsl:value-of select="./i6:lowerValue "/>
                <xsl:value-of select="./i6:upperQualifier "/>
                <xsl:value-of select="./i6:upperValue "/>
                <xsl:choose>
                    <xsl:when test="./i6:unitCode = '58423'"> CFU/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '129320'"> CFU/g diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '58425'"> IU/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '129321'"> IU/g diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '116598'"> OB/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '129322'"> OB/g diet</xsl:when>
                    <xsl:when test="./i6:unitCode = '1935'"> g/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2098'"> mg/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2123'"> mmol/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2127'"> mol/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2155'"> ng/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '116599'"> spores/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2500'"> µg/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '2504'"> µmol/L</xsl:when>
                    <xsl:when test="./i6:unitCode = '1342'"> other:</xsl:when>
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
                    <xsl:when test="./i6:value = '60878'">the study does not need to be conducted because the substance is highly insoluble in water, hence indicating that aquatic toxicity is unlikely to occur</xsl:when>
                    <xsl:when test="./i6:value = '60879'">the study does not need to be conducted because the substance is unlikely to cross biological membranes, hence indicating that aquatic toxicity is unlikely to occur</xsl:when>
                    <xsl:when test="./i6:value = '60881'">the study does not need to be conducted because a long-term aquatic toxicity study on fish is available</xsl:when>
                    <xsl:when test="./i6:value = '60882'">the study does not need to be conducted because a long-term aquatic toxicity study on fish is proposed to be conducted</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:Endpoint | //xt:StudyResultType | //xt:PurposeFlag | //xt:Reliability | //xt:RationalReliability | //xt:DataWaiving | //xt:ReasonPurpose | //xt:ReasonPurpose | //xt:DataAccess | //xt:DataProtectionClaimed | //xt:Qualifier | //xt:Guideline | //xt:Deviation | //xt:GLPComplianceStatement | //xt:AnalyticalMonitoring | //xt:Vehicle | //xt:TestOrganismsSpecies | //xt:TestType | //xt:WaterMediaType | //xt:LimitTest | //xt:ReferenceSubstancePositiveControl | //xt:Endpoint | //xt:NominalMeasured | //xt:ConcBasedOn | //xt:BasisForEffect | //xt:RemarksOnResults | //xt:Type | //xt:ValidityCriteriaFulfilled">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'AnalyticalMonitoring'">Analytical monitoring</xsl:when>
                    <xsl:when test="name(.) = 'DataWaiving'">Data waiving</xsl:when>
                    <xsl:when test="name(.) = 'TestType'">Test type</xsl:when>
                    <xsl:when test="name(.) = 'PurposeFlag'">Adequacy of study</xsl:when>
                    <xsl:when test="name(.) = 'DataAccess'">Data access</xsl:when>
                    <xsl:when test="name(.) = 'Vehicle'">Vehicle</xsl:when>
                    <xsl:when test="name(.) = 'Endpoint'">Dose descriptor</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Remarks on result</xsl:when>
                    <xsl:when test="name(.) = 'RationalReliability'">Rationale for reliability incl. deficiencies</xsl:when>
                    <xsl:when test="name(.) = 'DataProtectionClaimed'">Data protection claimed</xsl:when>
                    <xsl:when test="name(.) = 'Qualifier'">Qualifier</xsl:when>
                    <xsl:when test="name(.) = 'ConcBasedOn'">Conc. based on</xsl:when>
                    <xsl:when test="name(.) = 'NominalMeasured'">Nominal / measured</xsl:when>
                    <xsl:when test="name(.) = 'LimitTest'">Limit test</xsl:when>
                    <xsl:when test="name(.) = 'Guideline'">Guideline</xsl:when>
                    <xsl:when test="name(.) = 'BasisForEffect'">Basis for effect</xsl:when>
                    <xsl:when test="name(.) = 'ReasonPurpose'">Reason / purpose for cross-reference</xsl:when>
                    <xsl:when test="name(.) = 'GLPComplianceStatement'">GLP compliance</xsl:when>
                    <xsl:when test="name(.) = 'ValidityCriteriaFulfilled'">Validity criteria fulfilled</xsl:when>
                    <xsl:when test="name(.) = 'Type'">Type</xsl:when>
                    <xsl:when test="name(.) = 'TestOrganismsSpecies'">Test organisms (species)</xsl:when>
                    <xsl:when test="name(.) = 'ReferenceSubstancePositiveControl'">Reference substance (positive control)</xsl:when>
                    <xsl:when test="name(.) = 'Reliability'">Reliability</xsl:when>
                    <xsl:when test="name(.) = 'Deviation'">Deviations</xsl:when>
                    <xsl:when test="name(.) = 'StudyResultType'">Type of information</xsl:when>
                    <xsl:when test="name(.) = 'WaterMediaType'">Water media type</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '3335'">short-term toxicity to fish</xsl:when>
                    <xsl:when test="./i6:value = '62141'">fish embryo acute toxicity (FET)</xsl:when>
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
                    <xsl:when test="./i6:value = '1201'">OECD Guideline 203 (Fish, Acute Toxicity Test)</xsl:when>
                    <xsl:when test="./i6:value = '1202'">OECD Guideline 204 (Fish, Prolonged Toxicity Test: 14-day Study)</xsl:when>
                    <xsl:when test="./i6:value = '60883'">OECD Guideline 236 (Fish embryo acute toxicity (FET) test)</xsl:when>
                    <xsl:when test="./i6:value = '399'">EPA OPP 72-1 (Fish Acute Toxicity Test)</xsl:when>
                    <xsl:when test="./i6:value = '461'">EPA OPPTS 850.1075 (Freshwater and Saltwater Fish Acute Toxicity Test)</xsl:when>
                    <xsl:when test="./i6:value = '462'">EPA OPPTS 850.1085 (Fish Acute Toxicity Test mitigated by humic acid)</xsl:when>
                    <xsl:when test="./i6:value = '131510'">EPA OPPTS 885.0001 (Overview for Microbial Pest Control Agents)</xsl:when>
                    <xsl:when test="./i6:value = '129831'">EPA OPPTS 885.4000 (Background for Non-target Organism Testing of Microbial Pest Control Agents)</xsl:when>
                    <xsl:when test="./i6:value = '108540'">EPA OPPTS 885.4200 (Microbial Pesticide, Freshwater Fish Testing, Tier I)</xsl:when>
                    <xsl:when test="./i6:value = '108541'">EPA OPPTS 885.4700  (Microbial Pesticide, Fish Life Cycle Studies, Tier III)</xsl:when>
                    <xsl:when test="./i6:value = '129323'">EPA OPPTS 885.5000 (Microbial Pesticide, Background for Microbial Pesticides Testing)</xsl:when>
                    <xsl:when test="./i6:value = '579'">EPA OTS 797.1400 (Fish Acute Toxicity Test)</xsl:when>
                    <xsl:when test="./i6:value = '580'">EPA OTS 797.1460 (Fish Acute Toxicity Test mitigated by humic acid)</xsl:when>
                    <xsl:when test="./i6:value = '706'">EU Method C.1 (Acute Toxicity for Fish)</xsl:when>
                    <xsl:when test="./i6:value = '108722'">EU Method C.49 Fish Embryo Acute Toxicity (FET) Test</xsl:when>
                    <xsl:when test="./i6:value = '870'">ISO 7346-1 (Determination of the Acute Lethal Toxicity of Substances to a Freshwater Fish [Brachydanio rerio Hamilton-Buchanan (Teleostei, Cyprinidae)] - Part 1: Static Method)</xsl:when>
                    <xsl:when test="./i6:value = '871'">ISO 7346-1 (Determination of the Acute Lethal Toxicity of Substances to a Freshwater Fish [Brachydanio rerio Hamilton-Buchanan (Teleostei, Cyprinidae)] - Part 2: Semi-static method)</xsl:when>
                    <xsl:when test="./i6:value = '872'">ISO 7346-1 (Determination of the Acute Lethal Toxicity of Substances to a Freshwater Fish [Brachydanio rerio Hamilton-Buchanan (Teleostei, Cyprinidae)] - Part 3: Flow-through method)</xsl:when>
                    <xsl:when test="./i6:value = '873'">ISO 7346/1-3 (Determination of the Acute Lethal Toxicity of Substances to a Freshwater Fish [Brachydanio rerio Hamilton-Buchanan (Teleostei, Cyprinidae)])</xsl:when>
                    <xsl:when test="./i6:value = '2246'">other guideline:</xsl:when>
                    <xsl:when test="./i6:value = '2158'">no</xsl:when>
                    <xsl:when test="./i6:value = '4179'">yes (incl. QA statement)</xsl:when>
                    <xsl:when test="./i6:value = '2203'">not required</xsl:when>
                    <xsl:when test="./i6:value = '55'">Alburnus albidus costa</xsl:when>
                    <xsl:when test="./i6:value = '56'">Alburnus alburnus</xsl:when>
                    <xsl:when test="./i6:value = '57'">Alburnus lucidus</xsl:when>
                    <xsl:when test="./i6:value = '58'">Alburnus sp.</xsl:when>
                    <xsl:when test="./i6:value = '65'">Alosa pseudobarengus</xsl:when>
                    <xsl:when test="./i6:value = '87'">Anchoa mitchilli</xsl:when>
                    <xsl:when test="./i6:value = '90'">Anguilla anguilla</xsl:when>
                    <xsl:when test="./i6:value = '91'">Anguilla japonica</xsl:when>
                    <xsl:when test="./i6:value = '92'">Anguilla rostrata</xsl:when>
                    <xsl:when test="./i6:value = '93'">Anguilla sp.</xsl:when>
                    <xsl:when test="./i6:value = '140'">Barbus barbus</xsl:when>
                    <xsl:when test="./i6:value = '4455'">Brachydanio rerio (new name: Danio rerio)</xsl:when>
                    <xsl:when test="./i6:value = '161'">Brevoortia patronus</xsl:when>
                    <xsl:when test="./i6:value = '162'">Brevoortia tyrannus</xsl:when>
                    <xsl:when test="./i6:value = '213'">Carassius auratus</xsl:when>
                    <xsl:when test="./i6:value = '214'">Carassius carassius</xsl:when>
                    <xsl:when test="./i6:value = '215'">Carassius sp.</xsl:when>
                    <xsl:when test="./i6:value = '216'">Carassius vulgaris</xsl:when>
                    <xsl:when test="./i6:value = '231'">Catostomus commersoni</xsl:when>
                    <xsl:when test="./i6:value = '233'">Centropomus undecimalis</xsl:when>
                    <xsl:when test="./i6:value = '234'">Centropristis striata</xsl:when>
                    <xsl:when test="./i6:value = '259'">Clupea harengus</xsl:when>
                    <xsl:when test="./i6:value = '264'">Colisa fasciatus</xsl:when>
                    <xsl:when test="./i6:value = '274'">Coregonus artedii</xsl:when>
                    <xsl:when test="./i6:value = '275'">Coregonus clupeaformis</xsl:when>
                    <xsl:when test="./i6:value = '290'">Ctenopharyngodon idella</xsl:when>
                    <xsl:when test="./i6:value = '296'">Cymatogaster aggregata</xsl:when>
                    <xsl:when test="./i6:value = '297'">Cynoscion nebulosus</xsl:when>
                    <xsl:when test="./i6:value = '298'">Cyprinodon sp.</xsl:when>
                    <xsl:when test="./i6:value = '299'">Cyprinodon variegatus</xsl:when>
                    <xsl:when test="./i6:value = '300'">Cyprinus auratus</xsl:when>
                    <xsl:when test="./i6:value = '301'">Cyprinus carassius</xsl:when>
                    <xsl:when test="./i6:value = '302'">Cyprinus carpio</xsl:when>
                    <xsl:when test="./i6:value = '303'">Cyprinus sp.</xsl:when>
                    <xsl:when test="./i6:value = '324'">Danio rerio (previous name: Brachydanio rerio)</xsl:when>
                    <xsl:when test="./i6:value = '3892'">Danio rerio (reported as Brachydanio rerio)</xsl:when>
                    <xsl:when test="./i6:value = '108723'">Dicentrarchus labrax</xsl:when>
                    <xsl:when test="./i6:value = '341'">Dorosoma petenese</xsl:when>
                    <xsl:when test="./i6:value = '750'">Esox lucius</xsl:when>
                    <xsl:when test="./i6:value = '751'">Esox masquinongi</xsl:when>
                    <xsl:when test="./i6:value = '752'">Esox niger</xsl:when>
                    <xsl:when test="./i6:value = '753'">Esox sp.</xsl:when>
                    <xsl:when test="./i6:value = '781'">Fundulus confluentus</xsl:when>
                    <xsl:when test="./i6:value = '782'">Fundulus diaphanus</xsl:when>
                    <xsl:when test="./i6:value = '783'">Fundulus grandis</xsl:when>
                    <xsl:when test="./i6:value = '784'">Fundulus heteroclitus</xsl:when>
                    <xsl:when test="./i6:value = '785'">Fundulus jenkinsi</xsl:when>
                    <xsl:when test="./i6:value = '786'">Fundulus lucidae</xsl:when>
                    <xsl:when test="./i6:value = '787'">Fundulus majalis</xsl:when>
                    <xsl:when test="./i6:value = '788'">Fundulus similis</xsl:when>
                    <xsl:when test="./i6:value = '789'">Fundulus sp.</xsl:when>
                    <xsl:when test="./i6:value = '794'">Gadus morrhua</xsl:when>
                    <xsl:when test="./i6:value = '795'">Gambusia affinis</xsl:when>
                    <xsl:when test="./i6:value = '803'">Gasterosteus aculeatus</xsl:when>
                    <xsl:when test="./i6:value = '806'">Gaus mexlaughs</xsl:when>
                    <xsl:when test="./i6:value = '830'">Harengula pensacolae</xsl:when>
                    <xsl:when test="./i6:value = '883'">Ictalurus catus</xsl:when>
                    <xsl:when test="./i6:value = '884'">Ictalurus furcatus</xsl:when>
                    <xsl:when test="./i6:value = '885'">Ictalurus melas</xsl:when>
                    <xsl:when test="./i6:value = '886'">Ictalurus natalis</xsl:when>
                    <xsl:when test="./i6:value = '887'">Ictalurus nebulosus</xsl:when>
                    <xsl:when test="./i6:value = '888'">Ictalurus punctatus</xsl:when>
                    <xsl:when test="./i6:value = '889'">Ictalurus sp.</xsl:when>
                    <xsl:when test="./i6:value = '891'">Idus idus</xsl:when>
                    <xsl:when test="./i6:value = '920'">Jordanella floridae</xsl:when>
                    <xsl:when test="./i6:value = '984'">Lagodon rhomboides</xsl:when>
                    <xsl:when test="./i6:value = '986'">Lebistes reticulatus</xsl:when>
                    <xsl:when test="./i6:value = '988'">Leiostomus xanthurus</xsl:when>
                    <xsl:when test="./i6:value = '999'">Lepomis auritus</xsl:when>
                    <xsl:when test="./i6:value = '1000'">Lepomis cyanellus</xsl:when>
                    <xsl:when test="./i6:value = '1001'">Lepomis gibbosus</xsl:when>
                    <xsl:when test="./i6:value = '1002'">Lepomis humilis</xsl:when>
                    <xsl:when test="./i6:value = '1003'">Lepomis macrochirus</xsl:when>
                    <xsl:when test="./i6:value = '1004'">Lepomis microlophus</xsl:when>
                    <xsl:when test="./i6:value = '1005'">Lepomis pallidus</xsl:when>
                    <xsl:when test="./i6:value = '1006'">Lepomis sp.</xsl:when>
                    <xsl:when test="./i6:value = '1008'">Leuciscus cephalus cabeda rissa</xsl:when>
                    <xsl:when test="./i6:value = '1009'">Leuciscus idus</xsl:when>
                    <xsl:when test="./i6:value = '1010'">Leuciscus idus melanotus</xsl:when>
                    <xsl:when test="./i6:value = '1011'">Leuciscus rutilus</xsl:when>
                    <xsl:when test="./i6:value = '1012'">Leuciscus sp.</xsl:when>
                    <xsl:when test="./i6:value = '1015'">Limanda aspera</xsl:when>
                    <xsl:when test="./i6:value = '1016'">Limanda limanda</xsl:when>
                    <xsl:when test="./i6:value = '1017'">Limanda sp.</xsl:when>
                    <xsl:when test="./i6:value = '1062'">Menidia beryllina</xsl:when>
                    <xsl:when test="./i6:value = '1063'">Menidia menidia</xsl:when>
                    <xsl:when test="./i6:value = '1064'">Menidia peninsulae</xsl:when>
                    <xsl:when test="./i6:value = '1065'">Menidia sp.</xsl:when>
                    <xsl:when test="./i6:value = '1071'">Micropogon undulatus</xsl:when>
                    <xsl:when test="./i6:value = '1072'">Micropterus dolomieui</xsl:when>
                    <xsl:when test="./i6:value = '1073'">Micropterus salmoides</xsl:when>
                    <xsl:when test="./i6:value = '1074'">Micropterus sp.</xsl:when>
                    <xsl:when test="./i6:value = '1079'">Misgurnus anguillicaudatus</xsl:when>
                    <xsl:when test="./i6:value = '1087'">Morone chrysops</xsl:when>
                    <xsl:when test="./i6:value = '1088'">Morone saxatilis</xsl:when>
                    <xsl:when test="./i6:value = '1089'">Morone sp.</xsl:when>
                    <xsl:when test="./i6:value = '1093'">Mugil cephalus</xsl:when>
                    <xsl:when test="./i6:value = '1094'">Mugil curema</xsl:when>
                    <xsl:when test="./i6:value = '1095'">Mugil sp.</xsl:when>
                    <xsl:when test="./i6:value = '1178'">Notropis atherinoides</xsl:when>
                    <xsl:when test="./i6:value = '1316'">Oncorhynchus gorbuscha</xsl:when>
                    <xsl:when test="./i6:value = '1317'">Oncorhynchus keta</xsl:when>
                    <xsl:when test="./i6:value = '1318'">Oncorhynchus kisutch</xsl:when>
                    <xsl:when test="./i6:value = '1319'">Oncorhynchus mykiss (previous name: Salmo gairdneri)</xsl:when>
                    <xsl:when test="./i6:value = '3893'">Oncorhynchus mykiss (reported as Salmo gairdneri)</xsl:when>
                    <xsl:when test="./i6:value = '1321'">Oncorhynchus nerka</xsl:when>
                    <xsl:when test="./i6:value = '1322'">Oncorhynchus nerka kennerlyi</xsl:when>
                    <xsl:when test="./i6:value = '1323'">Oncorhynchus sp.</xsl:when>
                    <xsl:when test="./i6:value = '1324'">Oncorhynchus tschawytscha</xsl:when>
                    <xsl:when test="./i6:value = '1337'">Oryzias latipes</xsl:when>
                    <xsl:when test="./i6:value = '1340'">Osmerus mordax</xsl:when>
                    <xsl:when test="./i6:value = '108724'">Pagrus major</xsl:when>
                    <xsl:when test="./i6:value = '1357'">Parophrys vetulus</xsl:when>
                    <xsl:when test="./i6:value = '1359'">Perca flavescens</xsl:when>
                    <xsl:when test="./i6:value = '1360'">Perca fluviatilis</xsl:when>
                    <xsl:when test="./i6:value = '1361'">Perca sp.</xsl:when>
                    <xsl:when test="./i6:value = '1364'">Petromyzon fluviatilis</xsl:when>
                    <xsl:when test="./i6:value = '1365'">Petromyzon marinus</xsl:when>
                    <xsl:when test="./i6:value = '1366'">Petromyzon sp.</xsl:when>
                    <xsl:when test="./i6:value = '1373'">Phoxinus laevis</xsl:when>
                    <xsl:when test="./i6:value = '1374'">Phoxinus phoxinus</xsl:when>
                    <xsl:when test="./i6:value = '1375'">Phoxinus sp.</xsl:when>
                    <xsl:when test="./i6:value = '1377'">Pimephales notatus</xsl:when>
                    <xsl:when test="./i6:value = '1378'">Pimephales promelas</xsl:when>
                    <xsl:when test="./i6:value = '1379'">Pimephales sp.</xsl:when>
                    <xsl:when test="./i6:value = '1383'">Platypoecilus maculatus</xsl:when>
                    <xsl:when test="./i6:value = '1386'">Pleuronectes platessa</xsl:when>
                    <xsl:when test="./i6:value = '1388'">Poecilia latipinna</xsl:when>
                    <xsl:when test="./i6:value = '1389'">Poecilia reticulata</xsl:when>
                    <xsl:when test="./i6:value = '1390'">Poecilia sp.</xsl:when>
                    <xsl:when test="./i6:value = '1393'">Pogonias cromis</xsl:when>
                    <xsl:when test="./i6:value = '1396'">Pomatomus saltatrix</xsl:when>
                    <xsl:when test="./i6:value = '1397'">Pomoxis annularis</xsl:when>
                    <xsl:when test="./i6:value = '1398'">Pomoxis nigromaculatus</xsl:when>
                    <xsl:when test="./i6:value = '1430'">Prosopium williamsoni</xsl:when>
                    <xsl:when test="./i6:value = '1439'">Pseudopleuronectes americanus</xsl:when>
                    <xsl:when test="./i6:value = '1442'">Ptychocheilus oregonensis</xsl:when>
                    <xsl:when test="./i6:value = '1477'">Rasbora heteromorpha</xsl:when>
                    <xsl:when test="./i6:value = '1490'">Rhodeus sericeus</xsl:when>
                    <xsl:when test="./i6:value = '1494'">Roccus americanus</xsl:when>
                    <xsl:when test="./i6:value = '1498'">Rutilus rutilus</xsl:when>
                    <xsl:when test="./i6:value = '1510'">Salmo aquabonita</xsl:when>
                    <xsl:when test="./i6:value = '1511'">Salmo clarki</xsl:when>
                    <xsl:when test="./i6:value = '1320'">Salmo gairdneri (new name: Oncorhynchus mykiss)</xsl:when>
                    <xsl:when test="./i6:value = '1512'">Salmo irideus</xsl:when>
                    <xsl:when test="./i6:value = '1513'">Salmo salar</xsl:when>
                    <xsl:when test="./i6:value = '1514'">Salmo sp.</xsl:when>
                    <xsl:when test="./i6:value = '1515'">Salmo trutta</xsl:when>
                    <xsl:when test="./i6:value = '1516'">Salvelinus alpinus</xsl:when>
                    <xsl:when test="./i6:value = '1517'">Salvelinus fontinalis</xsl:when>
                    <xsl:when test="./i6:value = '1518'">Salvelinus malma</xsl:when>
                    <xsl:when test="./i6:value = '1519'">Salvelinus namaycush</xsl:when>
                    <xsl:when test="./i6:value = '1520'">Salvelinus sp.</xsl:when>
                    <xsl:when test="./i6:value = '1526'">Sardinops sagax</xsl:when>
                    <xsl:when test="./i6:value = '1527'">Sarotherodon mossambicus</xsl:when>
                    <xsl:when test="./i6:value = '1531'">Scardinius erythrophthalmus</xsl:when>
                    <xsl:when test="./i6:value = '1537'">Sciaenops ocellata</xsl:when>
                    <xsl:when test="./i6:value = '1545'">Semolitus atromaculatus</xsl:when>
                    <xsl:when test="./i6:value = '1569'">Sphaeroidus maculatus</xsl:when>
                    <xsl:when test="./i6:value = '1581'">Stizostedion canadense</xsl:when>
                    <xsl:when test="./i6:value = '1582'">Stizostedion v. vitreum</xsl:when>
                    <xsl:when test="./i6:value = '1611'">Tinca sp.</xsl:when>
                    <xsl:when test="./i6:value = '1612'">Tinca tinca</xsl:when>
                    <xsl:when test="./i6:value = '1613'">Tinca vulgaris</xsl:when>
                    <xsl:when test="./i6:value = '1639'">Trutta iridea</xsl:when>
                    <xsl:when test="./i6:value = '2392'">static</xsl:when>
                    <xsl:when test="./i6:value = '2339'">semi-static</xsl:when>
                    <xsl:when test="./i6:value = '1914'">flow-through</xsl:when>
                    <xsl:when test="./i6:value = '1777'">brackish water</xsl:when>
                    <xsl:when test="./i6:value = '1920'">freshwater</xsl:when>
                    <xsl:when test="./i6:value = '2326'">saltwater</xsl:when>
                    <xsl:when test="./i6:value = '922'">LC0</xsl:when>
                    <xsl:when test="./i6:value = '923'">LC10</xsl:when>
                    <xsl:when test="./i6:value = '926'">LC50</xsl:when>
                    <xsl:when test="./i6:value = '924'">LC100</xsl:when>
                    <xsl:when test="./i6:value = '360'">EC0</xsl:when>
                    <xsl:when test="./i6:value = '361'">EC10</xsl:when>
                    <xsl:when test="./i6:value = '365'">EC50</xsl:when>
                    <xsl:when test="./i6:value = '362'">EC100</xsl:when>
                    <xsl:when test="./i6:value = '933'">LL0</xsl:when>
                    <xsl:when test="./i6:value = '934'">LL10</xsl:when>
                    <xsl:when test="./i6:value = '936'">LL50</xsl:when>
                    <xsl:when test="./i6:value = '935'">LL100</xsl:when>
                    <xsl:when test="./i6:value = '368'">EL0</xsl:when>
                    <xsl:when test="./i6:value = '369'">EL10</xsl:when>
                    <xsl:when test="./i6:value = '373'">EL50</xsl:when>
                    <xsl:when test="./i6:value = '370'">EL100</xsl:when>
                    <xsl:when test="./i6:value = '855'">IC10</xsl:when>
                    <xsl:when test="./i6:value = '857'">IC50</xsl:when>
                    <xsl:when test="./i6:value = '856'">IC100</xsl:when>
                    <xsl:when test="./i6:value = '1149'">NOELR</xsl:when>
                    <xsl:when test="./i6:value = '976'">LOELR</xsl:when>
                    <xsl:when test="./i6:value = '1129'">NOEC</xsl:when>
                    <xsl:when test="./i6:value = '957'">LOEC</xsl:when>
                    <xsl:when test="./i6:value = '2178'">nominal</xsl:when>
                    <xsl:when test="./i6:value = '2002'">meas. (initial)</xsl:when>
                    <xsl:when test="./i6:value = '1941'">meas. (geom. mean)</xsl:when>
                    <xsl:when test="./i6:value = '1736'">meas. (arithm. mean)</xsl:when>
                    <xsl:when test="./i6:value = '2421'">meas. (TWA)</xsl:when>
                    <xsl:when test="./i6:value = '4038'">meas. (not specified)</xsl:when>
                    <xsl:when test="./i6:value = '1685'">acid equivalent</xsl:when>
                    <xsl:when test="./i6:value = '1884'">estimated</xsl:when>
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
                    <xsl:when test="./i6:value = '108727'">abnormality appearance (fish)</xsl:when>
                    <xsl:when test="./i6:value = '108726'">abnormality equilibrium (fish)</xsl:when>
                    <xsl:when test="./i6:value = '131512'">abnormality skin pigmentation</xsl:when>
                    <xsl:when test="./i6:value = '108729'">abnormality swimming behaviour (fish)</xsl:when>
                    <xsl:when test="./i6:value = '108728'">abnormality ventilatory behaviour (fish)</xsl:when>
                    <xsl:when test="./i6:value = '144'">behaviour</xsl:when>
                    <xsl:when test="./i6:value = '62137'">coagulation of the embryo</xsl:when>
                    <xsl:when test="./i6:value = '62140'">lack of heartbeat (embryo)</xsl:when>
                    <xsl:when test="./i6:value = '62138'">lack of somite formation (embryo)</xsl:when>
                    <xsl:when test="./i6:value = '2162'">mobility</xsl:when>
                    <xsl:when test="./i6:value = '2134'">morphology</xsl:when>
                    <xsl:when test="./i6:value = '108731'">mortality (embryo)</xsl:when>
                    <xsl:when test="./i6:value = '108725'">mortality (fish)</xsl:when>
                    <xsl:when test="./i6:value = '62139'">non-detachment of the tail (embryo)</xsl:when>
                    <xsl:when test="./i6:value = '108730'">other abnormalities (fish)</xsl:when>
                    <xsl:when test="./i6:value = '2469'">weight</xsl:when>
                    <xsl:when test="./i6:value = '60206'">not determinable</xsl:when>
                    <xsl:when test="./i6:value = '60207'">not determinable because of methodological limitations</xsl:when>
                    <xsl:when test="./i6:value = '60208'">not measured/tested</xsl:when>
                    <xsl:when test="./i6:value = '130898'">full study report</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AttachedJustification | //xt:CrossReference | //xt:Guideline | //xt:EffectConcentrations | //xt:AttachedBackgroundMaterial">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'EffectConcentrations'">Effect concentrations</xsl:when>
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
    <xsl:template match="//xt:AdministrativeData | //xt:DataSource | //xt:MaterialsAndMethods | //xt:TestMaterials | //xt:SamplingAndAnalysis | //xt:TestSolutions | //xt:TestOrganisms | //xt:StudyDesign | //xt:TestConditions | //xt:AnyOtherInformationOnMaterialsAndMethodsInclTables | //xt:ResultsAndDiscussion | //xt:AnyOtherInformationOnResultsInclTables | //xt:OverallRemarksAttachments | //xt:ApplicantSummaryAndConclusion">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'OverallRemarksAttachments'">Overall remarks, attachments</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeData'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'AnyOtherInformationOnResultsInclTables'">Any other information on results incl. tables</xsl:when>
                    <xsl:when test="name(.) = 'TestOrganisms'">Test organisms</xsl:when>
                    <xsl:when test="name(.) = 'StudyDesign'">Study design</xsl:when>
                    <xsl:when test="name(.) = 'TestSolutions'">Test solutions</xsl:when>
                    <xsl:when test="name(.) = 'DataSource'">Data source</xsl:when>
                    <xsl:when test="name(.) = 'SamplingAndAnalysis'">Sampling and analysis</xsl:when>
                    <xsl:when test="name(.) = 'TestConditions'">Test conditions</xsl:when>
                    <xsl:when test="name(.) = 'ApplicantSummaryAndConclusion'">Applicant's summary and conclusion</xsl:when>
                    <xsl:when test="name(.) = 'TestMaterials'">Test material</xsl:when>
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
    <xsl:template match="//xt:StudyPeriod | //xt:JustificationForTypeOfInformation | //xt:Remarks | //xt:VersionRemarks | //xt:MethodNoGuideline | //xt:SpecificDetailsOnTestMaterialUsedForTheStudy | //xt:SpecificDetailsOnTestMaterialUsedForTheStudyConfidential | //xt:DetailsOnSampling | //xt:DetailsOnAnalyticalMethods | //xt:DetailsOnTestSolutions | //xt:DetailsOnTestOrganisms | //xt:RemarksOnExposureDuration | //xt:PostExposureObservationPeriod | //xt:Hardness | //xt:TestTemperature | //xt:Ph | //xt:DissolvedOxygen | //xt:Salinity | //xt:Conductivity | //xt:NominalAndMeasuredConcentrations | //xt:DetailsOnTestConditions | //xt:OtherInformation | //xt:ResultsDetails | //xt:ResultsRefSubstance | //xt:Statistics | //xt:SublethalObservationsClinicalSigns | //xt:RemarksOnResults | //xt:Remarks | //xt:Conclusions | //xt:ExecutiveSummary">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'VersionRemarks'">Version / remarks</xsl:when>
                    <xsl:when test="name(.) = 'StudyPeriod'">Study period</xsl:when>
                    <xsl:when test="name(.) = 'PostExposureObservationPeriod'">Post exposure observation period</xsl:when>
                    <xsl:when test="name(.) = 'ResultsDetails'">Details on results</xsl:when>
                    <xsl:when test="name(.) = 'OtherInformation'"/>
                    <xsl:when test="name(.) = 'DetailsOnSampling'">Details on sampling</xsl:when>
                    <xsl:when test="name(.) = 'TestTemperature'">Test temperature</xsl:when>
                    <xsl:when test="name(.) = 'Remarks'">Remarks</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnResults'">Overall remarks</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnTestSolutions'">Details on test solutions</xsl:when>
                    <xsl:when test="name(.) = 'ExecutiveSummary'">Executive summary</xsl:when>
                    <xsl:when test="name(.) = 'Ph'">pH</xsl:when>
                    <xsl:when test="name(.) = 'SublethalObservationsClinicalSigns'">Sublethal observations / clinical signs</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudyConfidential'">Specific details on test material used for the study (confidential)</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnTestOrganisms'">Details on test organisms</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnAnalyticalMethods'">Details on analytical methods</xsl:when>
                    <xsl:when test="name(.) = 'ResultsRefSubstance'">Results with reference substance (positive control)</xsl:when>
                    <xsl:when test="name(.) = 'Conductivity'">Conductivity</xsl:when>
                    <xsl:when test="name(.) = 'Conclusions'">Conclusions</xsl:when>
                    <xsl:when test="name(.) = 'Hardness'">Hardness</xsl:when>
                    <xsl:when test="name(.) = 'Statistics'">Reported statistics and error estimates</xsl:when>
                    <xsl:when test="name(.) = 'Salinity'">Salinity</xsl:when>
                    <xsl:when test="name(.) = 'MethodNoGuideline'">Principles of method if other than guideline</xsl:when>
                    <xsl:when test="name(.) = 'DissolvedOxygen'">Dissolved oxygen</xsl:when>
                    <xsl:when test="name(.) = 'NominalAndMeasuredConcentrations'">Nominal and measured concentrations</xsl:when>
                    <xsl:when test="name(.) = 'JustificationForTypeOfInformation'">Justification for type of information</xsl:when>
                    <xsl:when test="name(.) = 'SpecificDetailsOnTestMaterialUsedForTheStudy'">Specific details on test material used for the study</xsl:when>
                    <xsl:when test="name(.) = 'RemarksOnExposureDuration'">Remarks on exposure duration</xsl:when>
                    <xsl:when test="name(.) = 'DetailsOnTestConditions'">Details on test conditions</xsl:when>
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
