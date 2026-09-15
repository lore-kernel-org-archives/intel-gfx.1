Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A02C88E73
	for <intel-gfx@archiver.kernel.org>; Tue, 15 Sep 2026 09:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8B510F353;
	Tue, 15 Sep 2026 09:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c398DJbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F9810F353
 for <intel-gfx@lists.freedesktop.org>; Tue, 15 Sep 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789462818; x=1820998818;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xVOGNc3PTOGNDJ8bZXYJMTTrdWOcyMap4Fj/6UD6Hj0=;
 b=c398DJbeUH0wkNdTGKJh1YxYxeUTJRuPoONsPqq8Hs1jQSWe5yrc487Y
 orHUgQPvl6oQByE9SDriiTiLPuneSN1oNbiyo5C2YBkK3bUaVQB5DildZ
 xoLgVVUMS/w3C1nBqRQmh619V6xjI7lhaB/62zpg4FOBoqB0QQuqZqBwE
 d1XRHt5gVi1IT17ijF1ZnLV0CNwtHb+JIw4lQBJxnQmRYoNlx5rBno1C5
 Vi3XRIbgZRI821YuSIEc8rtHv1Me7UkBYjXf8NInNrfRA8/7YTWvU0iZ4
 shIxVzPDcrxfoX4rcDHozg1V6ldy5ItlY3eRgk3X5izFFUR9dHhjl4jQh w==;
X-CSE-ConnectionGUID: JMZqRUwKSDSjs4qYGRw53w==
X-CSE-MsgGUID: kOzxjVxmTge33q0EOxwdxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115355705"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115355705"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:00:18 -0700
X-CSE-ConnectionGUID: 9Iom9mVeQL6EM7yL5NjKBg==
X-CSE-MsgGUID: ceexOqp7R8KQmJr8wIqbDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278181649"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:00:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 drm/i915/display: stop using the configurable fence timeout, cleanups
In-Reply-To: <178915420733.152712.10400122725172881029@61270ab9df2a>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1789069102.git.jani.nikula@intel.com>
 <178915420733.152712.10400122725172881029@61270ab9df2a>
Date: Tue, 15 Sep 2026 12:00:15 +0300
Message-ID: <d520355171afa55a704332c3439b398d1ea8c998@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 11 Sep 2026, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in Patchwork_173812v1_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@gem_ctx_persistence@engines-mixed-process@vcs1:
>     - shard-mtlp:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19124/shard-mtlp-4/igt@gem_ctx_persistence@engines-mixed-process@vcs1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173812v1/shard-mtlp-3/igt@gem_ctx_persistence@engines-mixed-process@vcs1.html
>
>   * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
>     - shard-mtlp:         [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19124/shard-mtlp-4/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173812v1/shard-mtlp-3/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
>
>   * igt@perf_pmu@rc6@runtime-pm-long-gt1:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6] +5 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19124/shard-mtlp-2/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_173812v1/shard-mtlp-7/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

These look worrying, but I'm not sure how the patches at hand could
cause them on MTL.

Ville, ack on merging the series?

BR,
Jani.


-- 
Jani Nikula, Intel
