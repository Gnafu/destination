<div id="main" class="links">
    <a href="http://destinationpa.csi.it/siig/" target="_blank"><img src="http://destinationpa.csi.it/siig/theme/app/img/BannerDestination_ftl.jpg" width="230" height="83" Hspace="10" Vspace="5"/></a>
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
					<#if attribute.name == 'descrizione_uso_' + request.ENV.LOCALE>
						<th>${["Use Description","Descrizione Uso","Descrizione Uso","Nutzungsbeschreibung"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'fonte_addetti_' + request.ENV.LOCALE>
						<th>${["Employees number source (Estimated / calculated)", "Fonte addetti", "Source du nombre d'employés (Estimé/calculé)", "Quelle der Bedienstetenzahlen"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'addetti'>
						<th>${["Employees number", "N. Addetti", "Nombre d'employés", "Anzahl der Bediensteten"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'fonte_numero_letti_day_h_' + request.ENV.LOCALE>
						<th>${["Day-Hospital beds number source (Estimated / calculated)", "Fonte N. Letti day hosp.", "Source du nombre de lits d'hôpital de jour (Estimé/calculé)s", "Quelle der Bettenzahlen des Day-Hospital (geschätzt/erhoben))"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'nr_letti_dh'>
						<th>${["Day-Hospital beds number", "N. Letti day hosp.", "Nombre de lits d'hôpital de jour", "Anzahl der Betten im Tageskrankenhaus/Day-Hospital"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'fonte_numero_letti_ordinari_' + request.ENV.LOCALE>
						<th>${["Ordinary beds number source (Estimated / calculated)", "Fonte N. Letti day ordin.", "Source du nombre de lits ordinaires (Estimé/calculé)", "Quelle der ordentlichen Bettenzahlen (geschätzt/erhoben)"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'letti_ordinari'>
						<th>${["Ordinary beds number", "N. Letti day ordin.", "Nombre de lits ordinaires", "Anzahl ordentliche Betten"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					<#if attribute.name == 'partner_' + request.ENV.LOCALE>
						<th>${["Partner","Partner","Partner","Partner"][locale]}</th><td>${attribute.value}</td> 
                    </#if>
					
                </tr>
        </#if>
    </#list>
	<th>${["Type","Tipologia","Tipologia","Tipologia"][locale]}</th><td>${["Sanitary Structures Users/Employees","Utenti/Addetti strutture sanitarie","Utenti/Addetti strutture sanitarie","Utenti/Addetti strutture sanitarie"][locale]}</td> 
    </tr>

</table>
<hr />
</#list>
<br/>
