Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF0FCE064
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Feb 2026 12:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A08F10E913;
	Thu, 26 Feb 2026 12:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YtG7/y8M";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BD610E913
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 12:25:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA24C406A7;
 Thu, 26 Feb 2026 12:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCE6C116C6;
 Thu, 26 Feb 2026 12:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772108712;
 bh=ovUc4py+O50vwIsT2ugfcaCC7uZrAi9UdhIVPKNvEHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YtG7/y8MI9Frr4QiFs+YxoBNnr1YUtEWu76azmpzajPvpa1fjpKn6RUXMKWFUL3GF
 b8Co+WlqlnQOzMePlz2X6WGmjthTAip/djwCVEA3c3AaEqs0MHtp3mWjUZbiSbwWvX
 rzroCCM1I6ezmDdzKEyhPSGXfaFuI9DgrwV11TTJbrXygLawPMTxavZVGUmDRmGfYb
 2sV76akicjsCUUdCk73+CRUx1qHa6NS5spXYUDOrWkDcGKHFwHHfxZYNfWD+PH0bh/
 eNg8igEEBBkZYtzmCWx/irq5AtQAfRQMFhLUENexVsqJS2OyolDux+u1Sd5lySHpmm
 AsWtPzxoP58Fg==
Date: Thu, 26 Feb 2026 13:25:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, 
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v7 2/2] drm: Avoid suspicious operations in
 drm_fb_dma_get_gem_addr()
Message-ID: <aaA7gIVXLaHnnzP1@zenone.zhora.eu>
References: <20260226104033.2073002-1-krzysztof.karas@intel.com>
 <20260226104033.2073002-3-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226104033.2073002-3-krzysztof.karas@intel.com>
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

Hi Krzysztof,

On Thu, Feb 26, 2026 at 10:40:33AM +0000, Krzysztof Karas wrote:
> In cases where dma_addr is a 64-bit value its calculation is
> still carried out using 32-bit arithmetic, which could
> occassionally cause a truncation of values before they are
> extended to 64 bits. Cast one of the operands to dma_addr_t,
> so 64-bit arithmetic is used.
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

I gave you my r-b here, as well.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
