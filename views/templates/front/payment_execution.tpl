{capture name=path}{l s='Prepay by Multibanco Reference' mod='multibancoprepagamento'}{/capture}


<h2>{l s='Order summary' mod='multibancoprepagamento'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

{if $nbProducts <= 0}
	<p class="warning">{l s='Your shopping cart is empty.' mod='multibancoprepagamento'}</p>
{else}

<h3>{l s='Pay by Multibanco Reference' mod='multibancoprepagamento'}</h3>
<form action="{$link->getModuleLink('multibancoprepagamento', 'validation', [], true)|escape:'html'}" method="post">
<div class="panel panel-default panel-paymentExecution">
	<div class="panel-header">
		<div>
			<img src="https://ifthenpay.com/img/logo_mb.png" alt="{l s='ATM' mod='multibancoprepagamento'}" width="49"/>
		</div>
	</div>
	<div class="panel-body">
		<p>
			{l s='You have chosen to pay by multibanco reference.' mod='multibancoprepagamento'}
		</p>
		<p>
			{l s='Here is a short summary of your order:' mod='multibancoprepagamento'}
		</p>
		<p>
			{l s='The total amount of your order is' mod='multibancoprepagamento'}
			<span id="amount" class="price">{displayPrice price=$total}</span>
			{if $use_taxes == 1}
				{l s='(tax incl.)' mod='multibancoprepagamento'}
			{/if}
		</p>
		<p>
			{l s='The amount you\'ll be paying by Multibanco is' mod='multibancoprepagamento'}
			<span id="amount" class="price">{displayPrice price=$totalMB}</span>
			{if $use_taxes == 1}
				{l s='(tax incl.)' mod='multibancoprepagamento'}
			{/if}
		</p>
		<p>
			{l s='The Multibanco Reference Information will be displayed on the next page.' mod='multibancoprepagamento'}
		</p>
		<p>
			<b>{l s='Please confirm your order by clicking "I confirm my order."' mod='multibancoprepagamento'}.</b>
		</p>
		</div>
	</div>
<p class="cart_navigation" id="cart_navigation">
	<a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html'}" class="button_large">{l s='Other payment methods' mod='multibancoprepagamento'}</a>
	<input type="submit" value="{l s='I confirm my order' mod='multibancoprepagamento'}" class="exclusive_large" style=" float: right; "/>
</p>
</form>
{/if}