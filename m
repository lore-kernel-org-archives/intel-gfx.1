Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C812CD4851
	for <intel-gfx@archiver.kernel.org>; Tue, 19 May 2026 11:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F5A10E3AF;
	Tue, 19 May 2026 11:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FL8xqPha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1103510E3AF
 for <intel-gfx@lists.freedesktop.org>; Tue, 19 May 2026 11:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779190359; x=1810726359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e0nlgJiYj4hSbSVr0OSCZpZLe072mBj3kTee0SEX5Is=;
 b=FL8xqPhacgYAXfA+/6D4TyYNYAPBfZOsdEgL0u571RciAmKmmDk9o9qV
 wGPgzlWjyNDFZzXS9UoaBS+9sqs31x7/WqqkaMlknTjZ1NZUFlBU5w2dP
 9FNs7t56wWgD65fkPONIPPid3A9yMCR40XV0IO6Wc2W7RYLhow1u3eB57
 XnvxpO9MZfXCFGHQ2tfq5Wk91vJXb6QuJG6IiFqfCvP1GtWe5S9zhUK8c
 NKG0f20umRG+ZcTfJ4ssbp/TZdcjKGKHXvJDxme/J9Pl96WHig/LD/rgO
 P2XwgW8YNYx3wsqylP9I+yMx4lMFe8oo6UZwdo0e1PG50rhNC4zSwkh1L w==;
X-CSE-ConnectionGUID: ECHLT3edSEOqIvXj+yUOjA==
X-CSE-MsgGUID: WKeNC2mXTASB+70JDKsquQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91458055"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91458055"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:32:39 -0700
X-CSE-ConnectionGUID: djM3GYkhTces6YYVZHkMnQ==
X-CSE-MsgGUID: RK3OnbBpSRmVQ66aknJn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="237126468"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.15])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 04:32:36 -0700
Date: Tue, 19 May 2026 13:32:33 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v10 0/2] drm/i915/selftests: Use safe userspace memory
 for mappings
Message-ID: <agxKUQDuDthp2WLD@ashyti-mobl2.lan>
References: <20260508080214.1979686-1-krzysztof.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508080214.1979686-1-krzysztof.karas@intel.com>
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

> Krzysztof Karas (2):
>   drm/i915/selftests: Prevent userspace mapping invalidation
>   drm/i915/selftests: Run vma tests only if current->mm is present

merged in drm-intel-gt-next.

Thanks,
Andi
