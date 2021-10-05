Return-Path: <SRS0=U9P+=OZ=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D63C433EF
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 10:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D545F6117A
	for <intel-gfx@archiver.kernel.org>; Tue,  5 Oct 2021 10:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D545F6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7585B6EB49;
	Tue,  5 Oct 2021 10:58:18 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6346EB49;
 Tue,  5 Oct 2021 10:58:17 +0000 (UTC)
Date: Tue, 5 Oct 2021 12:58:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633431495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAHyHaCinhZOdFYftqM/89jjw8Xeb/kKScWi7LzzlI8=;
 b=U2ELsyEDWyZbSCrQT/hgnQ5U4NTrq71BGEqvytE3wnGYgZ/s18tjf2dofTb4V7/ozzFAWh
 zdO6LrdWDgNj0/vwzTHdmUupbkf6OUJACTCrp/gPmpOrJzTmriRHfbEDihiD0RPKTyAn0B
 9WRXsbQH0o3MZft46kz9SbpYp+IubU2E/mmz+6XlLLysaupjdoMy6yYCCUnonLNhJ8XBFq
 jtA2uCGmFK9KOW6S1VWUiOETEwfY9XYMaIotOJa2rCGXyUYrDOfeFyim56a03+jgsu23u/
 AsOo/FSc852XWrzQ8FUeRILjdQ851u5AMpDEhvaRILqbtIeyociSRFXfTj+pkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633431495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAHyHaCinhZOdFYftqM/89jjw8Xeb/kKScWi7LzzlI8=;
 b=g4Y4EoJxBIvKJ4cf43bbj9qy5+5cEtk9ao1qxiHnuFq7XwgzpWiFZ7MaWC40tb6D+VDzDu
 A1Y9ZqHXicVuF2Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20211005105813.bgvfjebrizta7tzx@linutronix.de>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-26-matthew.brost@intel.com>
 <2a417f11-050a-2445-d5e9-38fe354402f2@intel.com>
 <20211005070656.25xszayci52wqe7h@linutronix.de>
 <c43aa0a4-0f3a-e9cd-2221-0f3ce3019421@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c43aa0a4-0f3a-e9cd-2221-0f3ce3019421@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 25/33] drm/i915/guc: Support request
 cancellation
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

On 2021-10-05 11:13:16 [+0100], Tvrtko Ursulin wrote:
> Needs this fix:
> 
> commit d576b31bdece7b5034047cbe21170e948198d32f
> Author: Matthew Auld <matthew.auld@intel.com>
> Date:   Fri Sep 24 15:46:46 2021 +0100
> 
>     drm/i915: remember to call i915_sw_fence_fini

Thanks, works. Needed a tweak since it does not apply as-is.

> But in the fix we forgot to add:
> 
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> 
> So not sure if it will appear on it's own. Adding Joonas and Rodrigo for
> maintainer level help.
> 
> Regards,
> 
> Tvrtko

Sebastian
