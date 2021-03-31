Return-Path: <SRS0=tUI/=I5=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847E2C433C1
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 10:22:57 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A2261989
	for <intel-gfx@archiver.kernel.org>; Wed, 31 Mar 2021 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A2261989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419BD6EA40;
	Wed, 31 Mar 2021 10:22:56 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048B16EA40;
 Wed, 31 Mar 2021 10:22:54 +0000 (UTC)
IronPort-SDR: YYvsRubkWmlwOJnJjC4kTJDsSpR+ZTL+mAHqVQKEGoLgNlfY+ttKeWkDZ5whWdVoC09XRbsc1F
 R153tVot0R0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="212212412"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="212212412"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:22:54 -0700
IronPort-SDR: c7xnkrKpZwEo2ZwdONa/19OwjSgZfiKbROjlbd19gfFjbtVYIspIeebpAQAjfxy5bzbPYPtL+r
 jCeFaGGcbOvg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="418603669"
Received: from ebilea-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.32.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 03:22:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
In-Reply-To: <87im5f2vz2.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210324113012.7564-1-anshuman.gupta@intel.com>
 <87im5f2vz2.fsf@intel.com>
Date: Wed, 31 Mar 2021 13:22:48 +0300
Message-ID: <87eefvoc5j.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [PATCH v2 0/2] HDCP 2.2 DP errata
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 25 Mar 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 24 Mar 2021, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
>> HDCP DP 2.2 errata is part of HDCP DP 2.3 specs
>> as well. 
>>
>> Anshuman Gupta (2):
>>   drm/i915/hdcp: Add DP HDCP2.2 timeout to read entire msg
>>   drm/hdcp: DP HDCP2.2 errata LC_Send_L_Prime=16
>>
>>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 45 ++++++++++++++------
>>  include/drm/drm_hdcp.h                       |  5 ++-
>>  2 files changed, 36 insertions(+), 14 deletions(-)
>
> Maarten, Maxime, Thomas -
>
> Can I get an ack for merging this via drm-intel-next, please?

Ping! :)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
