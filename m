Return-Path: <SRS0=AXNP=KO=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F73C433ED
	for <intel-gfx@archiver.kernel.org>; Wed, 19 May 2021 08:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5883A60FE8
	for <intel-gfx@archiver.kernel.org>; Wed, 19 May 2021 08:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5883A60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4BD6ECE3;
	Wed, 19 May 2021 08:25:35 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6136ECE0;
 Wed, 19 May 2021 08:25:33 +0000 (UTC)
IronPort-SDR: d7UmjA3SoBQzleVe5nq6IC484EUNFNP7KHACFTyX+te0I7A9rGsv2cAQDagNDI+XQzoeZSDOvq
 E7VmGU1m6lGg==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="264837906"
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="264837906"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:25:29 -0700
IronPort-SDR: P20o1fT9rO4uoOMWLf4hWE9/8CSZ0IvJap9Fj4x4GJdyhyxXRRFFrlQ0r8aRq2DJbFex0K+deV
 rmYzhrlYAwEg==
X-IronPort-AV: E=Sophos;i="5.82,312,1613462400"; d="scan'208";a="473387264"
Received: from akrolak-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.37.74])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 01:25:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <YKTKAT7szb+DvKRH@platvala-desk.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210511165117.428062-1-matthew.auld@intel.com>
 <20210511165117.428062-8-matthew.auld@intel.com>
 <YKTKAT7szb+DvKRH@platvala-desk.ger.corp.intel.com>
Date: Wed, 19 May 2021 11:25:24 +0300
Message-ID: <87o8d7dtaj.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH i-g-t 07/12] i915_drm.h sync
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
Cc: igt-dev@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Wed, 19 May 2021, Petri Latvala <petri.latvala@intel.com> wrote:
> On Tue, May 11, 2021 at 05:51:12PM +0100, Matthew Auld wrote:
>> Sync to get gem_create_ext and the regions query stuff.
>
> Kernel commit sha in commit message please.

Might be nice to have a script or a build target to update a file from
kernel, with the proper commit message.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
