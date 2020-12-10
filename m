Return-Path: <SRS0=CSZM=FO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00544C433FE
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 21:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B171F23E26
	for <intel-gfx@archiver.kernel.org>; Thu, 10 Dec 2020 21:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B171F23E26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141FB6EB57;
	Thu, 10 Dec 2020 21:04:23 +0000 (UTC)
X-Greylist: delayed 1811 seconds by postgrey-1.36 at gabe;
 Thu, 10 Dec 2020 21:04:21 UTC
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4DF6EB57;
 Thu, 10 Dec 2020 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=noa+454Phd4GD+cflUApEkbCBzQWdQM9xVdZ/BdtqiE=; b=ommLdATmScZCO3Nr0B0IKtaBD0
 EKrjnXBUtbfueazgUtm6VU6b3S0wYy6KVx4WAtwNJ/AqnjHK72Gy9Jsmxppzw/gnUhc4xUowZeQ7A
 VcHLuqMKttCxw8ez7I7uwmRr5QxGnTAmGxi8uXmfqMPsZhh7JjrJm5C+6KJYTWYREg/IlUxXKnLyU
 oiYCxI5xB8TP98NfY73pg38uPmgt4JkWMiii1mD9wV9ZT2fBKdzZ4FLSmo62RegEoh6XSnUbSd6AH
 TQacvQpLTj7RMyXxinaZaJU5rRKy+bJdREoJnd68m2upWyg2kGwzuZR1wf8InfiqQYZmWP3SPWvYA
 gjpGnwDw==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1knSdJ-0002Fm-25; Thu, 10 Dec 2020 13:33:50 -0700
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.255887860@linutronix.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <3526d997-a629-9843-7060-78d9e0a487c5@deltatee.com>
Date: Thu, 10 Dec 2020 13:33:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.255887860@linutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 jgross@suse.com, boris.ostrovsky@oracle.com, leon@kernel.org,
 saeedm@nvidia.com, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 kuba@kernel.org, davem@davemloft.net, tariqt@nvidia.com, Zhiqiang.Hou@nxp.com,
 m.karthikeyan@mobiveil.co.in, linux-pci@vger.kernel.org,
 michal.simek@xilinx.com, bhelgaas@google.com, robh@kernel.org,
 lorenzo.pieralisi@arm.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, tvrtko.ursulin@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 wambui.karugax@gmail.com, chris@chris-wilson.co.uk,
 pankaj.laxminarayan.bharadiya@intel.com, daniel@ffwll.ch, airlied@linux.ie,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 jani.nikula@linux.intel.com, linux-s390@vger.kernel.org, hca@linux.ibm.com,
 borntraeger@de.ibm.com, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux@armlinux.org.uk, linux-parisc@vger.kernel.org, afzal.mohd.ma@gmail.com,
 deller@gmx.de, James.Bottomley@HansenPartnership.com,
 linux-ntb@googlegroups.com, allenbh@gmail.com, dave.jiang@intel.com,
 jdmason@kudzu.us, maz@kernel.org, peterz@infradead.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de
X-SA-Exim-Mail-From: logang@deltatee.com
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Subject: Re: [Intel-gfx] [patch 17/30] NTB/msi: Use irq_has_action()
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-gpio@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-parisc@vger.kernel.org,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>



On 2020-12-10 12:25 p.m., Thomas Gleixner wrote:
> Use the proper core function.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jon Mason <jdmason@kudzu.us>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Allen Hubbe <allenbh@gmail.com>
> Cc: linux-ntb@googlegroups.com

Looks good to me.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

> ---
>  drivers/ntb/msi.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> --- a/drivers/ntb/msi.c
> +++ b/drivers/ntb/msi.c
> @@ -282,15 +282,13 @@ int ntbm_msi_request_threaded_irq(struct
>  				  struct ntb_msi_desc *msi_desc)
>  {
>  	struct msi_desc *entry;
> -	struct irq_desc *desc;
>  	int ret;
>  
>  	if (!ntb->msi)
>  		return -EINVAL;
>  
>  	for_each_pci_msi_entry(entry, ntb->pdev) {
> -		desc = irq_to_desc(entry->irq);
> -		if (desc->action)
> +		if (irq_has_action(entry->irq))
>  			continue;
>  
>  		ret = devm_request_threaded_irq(&ntb->dev, entry->irq, handler,
> 
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
