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
					
					<#if attribute.name == 'superficie'>
						<th>${["Area","Superficie","Superficie","Fläche"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'denominazione_bene_' + request.ENV.LOCALE>
						<th>${["Name","Denominazione","Denominazione","Benennung des Gutes"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'tipologia_' + request.ENV.LOCALE>
						<th>${["Type","Tipologia","Tipologia","Art des Gutes"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'partner_' + request.ENV.LOCALE>
						<th>${["Partner","Partner","Partner","Partner"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					
                </tr>
        </#if>
    </#list>
    </tr>

</table>
<hr />
</#list>
<br/>
