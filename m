Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D36C43458
	for <intel-gfx@archiver.kernel.org>; Fri, 26 Jun 2026 17:03:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A2E10E3E3;
	Fri, 26 Jun 2026 17:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jnh2mdZL";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E918010E3E3
 for <intel-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 17:03:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1134E600C8;
 Fri, 26 Jun 2026 17:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6721F000E9;
 Fri, 26 Jun 2026 17:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782493398;
 bh=4rrAftkLxi1y+HPrCUJnfP3Ufs7Pq3Uo5eEeHVYstzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=jnh2mdZLMRJROc36K8by/wHJZoS9xZ6Pu8QEhcHyWc7iVAbQAR+7x3eAME3yzyJ1B
 x/SIMNCJHEi4XspgU42IDGS86p5Il9Ub41NEkgU5zTN59Q+oL+F/O6nKrIIq3YC2Zx
 fHuxMf+EGjHniJQNwyzKBTJ7xOic6AuZyRkbHzgdo52zEN5JqsZNEsAl6h5KY1HJ1g
 c4Vu3FQdZE5VxeXO8OSVeEgkzQNdH/I4DgW1cdDO9Ntcj3+YD0q9FIZzj8R1bQdG/4
 DOw1QN2WwCXsBb55w5oFItj8LkNBoC9WT4MkiyAughoUDsxF9TDl/xQqZReaLQeMPX
 YO+B4HH/Pb5PQ==
Date: Fri, 26 Jun 2026 19:03:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-gfx@lists.freedesktop.org, saurabhg.gupta@intel.com, 
 alex.zuo@intel.com, michal.wajdeczko@intel.com, raag.jadav@intel.com, 
 andi.shyti@linux.intel.com, jani.nikula@intel.com
Subject: Re: [PATCH v5] drm/i915: Refactor generic_handle_irq_safe() error
 messages
Message-ID: <aj6wnC7KNEPKWJia@zenone.zhora.eu>
References: <20260623202310.1023770-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623202310.1023770-1-jonathan.cavitt@intel.com>
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

Hi Jonathan,

On Wed, Jun 24, 2026 at 04:23:10AM +0800, Jonathan Cavitt wrote:
> Refactor all error messages resulting from generic_handle_irq_safe()
> failures in I915 for clarity.
> 
> v2:
> - Use drm_err_ratelimited() correctly (jcavitt)
> 
> v3:
> - Use xe_err_ratelimited() instead (Jadav)
> - Split into patch series (jcavitt)
> 
> v4:
> - Use suggested phrasing (Wajdeczko)
> 
> v5:
> - s/PTR_ERR/ERR_PTR (jcavitt)
> 
> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> Suggested-by: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

merged to drm-intel-next.

Thanks,
Andi
