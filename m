Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFA6C5DF87
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 08:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74E210EE94;
	Fri, 21 Aug 2026 08:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oq8TniQl";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC45510EE94
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 08:51:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 55DCE43E10;
 Fri, 21 Aug 2026 08:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9191F00A3D;
 Fri, 21 Aug 2026 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787302290;
 bh=NAyXdu1AhLKU2EaVtwbyJuN/dH6zxKa7f15VJvl+Qgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=oq8TniQleLqPzlLgot4WpbShzIDrkTxKM11VVhuHE5C63oYpjXcMJmwll/+IjXPTR
 f/REWKgNjt+4BaFjXx+T57nKepCVzNwdzb8malR+4KcgFltiWH/h/q9E+QRgEdsD6N
 liS9JVS4J8ou3qg33/NFARRhTrVl9Z1Vi6KwwIgwlPHSK1/wAxEdEKbG6fu9x+4NL2
 6aHaVf70wUA/v0xXTsA/TAgEsdFaAvjxmwB9yYGATVJnicIFiirJuA5GXfCmBnByvz
 cB8jOqkaFhicdwsCRkH5zleX4cCmgGoz0wZO1vxlG9htiod2aRcGr6WS2EfLDzPm3l
 vbetFlqlyg0EQ==
Date: Fri, 21 Aug 2026 10:51:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Disable not supported reset methods on DG1 0x4905
Message-ID: <aogQ4fNchLVm9Pbg@zenone.zhora.eu>
References: <20260819102509.1662504-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819102509.1662504-2-janusz.krzysztofik@linux.intel.com>
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi Janusz,

On Wed, Aug 19, 2026 at 12:24:53PM +0200, Janusz Krzysztofik wrote:
> DRM CI consequently reports failing device reset attempts on Intel DG1

do you mean "consistently reports"?

> discrete graphics adapters.  Manual reproduction attempts allowed to
> narrow down the scope of that problem to a specific revision of that
> hardware, SKU 8086:4905.  It has been confirmed that both reset methods
> claimed by the device, i.e., flr and bus, suffer from that issue.
> 
> Since consecutively failing device resets may lead to system hangs,
> disable both useless reset methods.  A respective CI test will then be
> skipped instead of aborting whole CI jobs.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/11814
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
