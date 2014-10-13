<div id="main" class="links">
    <a href="http://lose.geo-solutions.it/lose/" target="_blank"><img src="http://lose.geo-solutions.it/lose/theme/app/img/BannerLose_ftl.jpg" width="230" height="83" Hspace="10" Vspace="5"/></a>
</div>

<#assign locale = {"en":0,"it":1,"fr":2,"de":3}[request.ENV.LOCALE]/>

<#list features as feature>
<table class="featureInfo">
  <tr>

    <th class="title">${["Attribute","Attribute","Attribute","Attribut"][locale]}</th><th class="title">${["Value","Value","Value","Wert"][locale]}</th>

  </tr>

<#assign odd = false>
    <#list feature.attributes as attribute>
        <#if !attribute.isGeometry>
         <#if odd>
         <tr class="odd">
         <#else>
                <tr>
                </#if>  

                <#assign odd = !odd>
					<#if attribute.name == 'denominazione_' + request.ENV.LOCALE>
						<th>${["Name","Denominazione","Denominazione","Benennung"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					<#if attribute.name == 'toponimo_completo_' + request.ENV.LOCALE>
						<th>${["Full Toponym","Toponimo completo","Toponimo completo","offizielle Benennung"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					                                                          
					<#if attribute.name == 'codice_clc'>
						<th>${["CLC Code","Codice CLC","Codice CLC","Kodex aus Corine Land Cover"][locale]}</th><td>${attribute.value}</td> 
                    </#if>                                                             
					<#if attribute.name == 'descrizione_clc_' + request.ENV.LOCALE>
						<th>${["CLC Description","Descrizione CLC","Descrizione CLC","Beschreibung gemäß Corine Land Cover"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					
					<#if attribute.name == 'superficie'>
						<th>${["Area","Superficie","Superficie","Fläche"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'profondita_max'>
						<th>${["Maximum depth", "Profondità max", "Profondeur maximale", "Maximale Tiefe"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'quota_pdc'>
						<th>${["Ground level altitude", "Quota", "Altitude du niveau du sol", "Höhe der Geländeoberfläche"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'partner_' + request.ENV.LOCALE>
						<th>${["Partner","Partner","Partner","Partner"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
                </tr>
        </#if>
    </#list>
	<th>${["Type","Tipologia","Tipologia","Tipologia"][locale]}</th><td>${["Surface Waters","Acque superficiali","Acque superficiali","Acque superficiali"][locale]}</td> 
    </tr>

</table>
<hr />
</#list>
<br/>
