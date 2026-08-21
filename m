Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E067C5DF87
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 12:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0F210EB40;
	Fri, 21 Aug 2026 12:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nzqcGnVG";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6110310EB40
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 12:19:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B96643D98;
 Fri, 21 Aug 2026 12:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6C91F000E9;
 Fri, 21 Aug 2026 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787314747;
 bh=IyS/zWEy1tYddP/7Ow+hFMgboxvmgF2BlHTAUQErr+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nzqcGnVGPbvm5A9wFpbWJ7ZBUnbFISNGUvyV8G82aYxGF/pdXRirLQh0rJI/BPFbO
 f+0FWhv0i9+E9J8g+6HEsl+HgdVmA3q6y+BN0T6bvP7+rXLwQM+o5v73wDAAw8EcaM
 dA/M087XpTknfiBIdxOTpZIscRAgVh2oWAG4gyL8iUKEEsCGGwrwFEvhWnxGoPlxG9
 yR6HqOuYb2lW8JLiFKAsk4ZK+7imhASnTy8QUZvqdObY1kdQf9zb4kq4dJP1I8iig2
 kjqRegYcmEXF5YKac3y5K2zgTWsk7+aN+7NmUK3CW42vFJxFXw1pscc1mt5C5sgLZF
 6k5A+MGi6BXaA==
Date: Fri, 21 Aug 2026 14:19:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sk Anirban <sk.anirban@intel.com>
Cc: intel-gfx@lists.freedesktop.org, anshuman.gupta@intel.com, 
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com, 
 raag.jadav@intel.com, soham.purkait@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH] drm/i915/selftests: Report missing RC0 power as an error
Message-ID: <aohCBV0dj7sHnSrR@zenone.zhora.eu>
References: <20260729112446.2919206-2-sk.anirban@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729112446.2919206-2-sk.anirban@intel.com>
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

Hi Anirban,

On Wed, Jul 29, 2026 at 04:54:47PM +0530, Sk Anirban wrote:
> The RC0 no-power case is a hard failure (-EINVAL); log it via pr_err
> instead of pr_debug so it is captured in default kernel logs.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Reviewed and merged to drm-intel-gt-next.

Thanks,
Andi
