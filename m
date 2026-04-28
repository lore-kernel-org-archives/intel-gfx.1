Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD63FF886F
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Apr 2026 15:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8042310ED33;
	Tue, 28 Apr 2026 15:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I8DkFOaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781610E110
 for <intel-gfx@lists.freedesktop.org>; Tue, 28 Apr 2026 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777388632; x=1808924632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=u6KJpZNG2rNk9/wGz/gPn3v1PIixHJQDOxJiJlKlNVI=;
 b=I8DkFOaTQ8Hh6cJyS66IB4g3jq8vlE5EZj+Ej6M2575YXIwtsW0Lskal
 tOOf00c3RfXtmBmQsaU/SqY9Iqh4lM9ucSeNwkBcCJ2z9Gr6S/C+9oHo8
 iuzX8rYyrQaAscIZ1JYOEtNG4dj4vDysN2ippHj//f2G+fupekzqGDB8X
 2Dh0LWDaYQQ64AomWqFA3cZZN9FL//Bj5Xz8l2kNTCU93QUSz0iKyJ+/y
 6UezJuACuEQzELVrJdsMFyyVk3FKUq7c5h7Vro4TS4EXCiBdAwUQQtlc8
 //SlH8g/8dGNBrOMqaIWDyMIaSHYusyDv08SRX2leWwk8BW4u380rwwy1 Q==;
X-CSE-ConnectionGUID: +/3woqAWRr+hsgu3n8C+KQ==
X-CSE-MsgGUID: NVJc0e6NT5OhMXKka6jLbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78283565"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78283565"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 08:03:50 -0700
X-CSE-ConnectionGUID: uZqh64zeQhSLRNYJo8uDZQ==
X-CSE-MsgGUID: fFZ+6zHETK2WKPRsL7ybSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="229619939"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 08:03:47 -0700
Date: Tue, 28 Apr 2026 17:03:45 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v7 2/2] drm/i915/selftests: Run vma tests only if
 current->mm is present
Message-ID: <afDMURdDYXupTqBM@ashyti-mobl2.lan>
References: <20260421061716.3341529-1-krzysztof.karas@intel.com>
 <20260421061716.3341529-3-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421061716.3341529-3-krzysztof.karas@intel.com>
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

On Tue, Apr 21, 2026 at 06:17:16AM +0000, Krzysztof Karas wrote:
> This set of tests require userspace memory to map objects,
> so run them only if that memory is available.
> 
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
