Return-Path: <SRS0=FEgb=NK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC6FC432BE
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Aug 2021 09:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB86660230
	for <intel-gfx@archiver.kernel.org>; Thu, 19 Aug 2021 09:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB86660230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED88A6E7D3;
	Thu, 19 Aug 2021 09:40:58 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631F16E4A5;
 Thu, 19 Aug 2021 09:40:57 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 17so5349437pgp.4;
 Thu, 19 Aug 2021 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cSp9NwnxyOgzJbrJbt1VGvD7OEziQgHeU2j99tNdlpo=;
 b=sQSaBnD6DGdXEu4FJn47XGvy9Us77bXl/nsDwl6TW3a5px8jRAmU5BnUTv35j7bPuY
 3ApUSU1sSc6EbAjTwbK0Pdg0Di3V4k2gIYVQt/l5ftJDfHoRmjl/f6HYf/9xefPrpYcf
 RvaaxlHcuL6K0AXxLaEjKCR2sHDRQ9ZmMi6gr4Dx58cfT5qWoQdO9ifYvKJjgKC4tHVQ
 5xHuZPlf3GBgkLrkmlW55FO7UN0AFNo65cCdcvOIuMsOS3FCTM7ASuOZXC/ohR861vKP
 5uiSuzSapT3AKJ1seorxrgJ8EfSO+dO1GvcAr719X04oAGT5GnR84dv75OOVQyDhAWaI
 ywbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cSp9NwnxyOgzJbrJbt1VGvD7OEziQgHeU2j99tNdlpo=;
 b=ZBb1pLUff4IADe31/mP10UgDcDO2YS8YqM8tG5UIj8fOmQf9wlUzok04H/F+YdyZB5
 pf05yOmZQH7TFlKv7YZblIF2XNkAUWGiVQtrHvq/BfPh0YNxG4puslp4cVtig6yGHGlQ
 lAVe7MjTGVPtHDK04/oV3QhLn4ZmpYn3xhvpg7An0zNcM8Tp9zfT+valyKTnNnWU1Yac
 LCZ+o/R17YeFd6KlpTWf2lqBPBiHg4tGqGUte4P87L9QVaVoxaWs3x253TNrKVOdPihk
 +JAsOSjysxw5oeD0ChQ0WsllkXCQb6wro2aQcUYAQUNt3vJB4pZGhDF3ASPK0FunQ3ak
 d+JQ==
X-Gm-Message-State: AOAM5330+e32bY+9DB9nElm+6tj4SOaCRFJhtfQo/eLimZzz43zit0dR
 hgiXehCEVzm64IfPyC880CI=
X-Google-Smtp-Source: ABdhPJxq85oVvDdy2A3J4ATn8gQFyT/xNOQ1HXI/IX1f0Jg4ari85I+VOJhHYh8682YWHufRJFmglQ==
X-Received: by 2002:a63:de01:: with SMTP id f1mr1177149pgg.377.1629366057013; 
 Thu, 19 Aug 2021 02:40:57 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id r14sm2740127pff.106.2021.08.19.02.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 02:40:56 -0700 (PDT)
To: Christoph Hellwig <hch@infradead.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 sumit.semwal@linaro.org, christian.koenig@amd.com, axboe@kernel.dk,
 oleg@redhat.com, tglx@linutronix.de, dvyukov@google.com,
 walter-zh.wu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 kernel test robot <lkp@intel.com>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-9-desmondcheongzx@gmail.com>
 <YR4jqvZtu0gbaVmx@infradead.org>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <71c8e827-92f2-f34a-c9a6-9fc6923d315f@gmail.com>
Date: Thu, 19 Aug 2021 17:40:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR4jqvZtu0gbaVmx@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-gfx] [PATCH v3 8/9] kernel: export task_work_add
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

On 19/8/21 5:26 pm, Christoph Hellwig wrote:
> On Wed, Aug 18, 2021 at 03:38:23PM +0800, Desmond Cheong Zhi Xi wrote:
>> +EXPORT_SYMBOL(task_work_add);
> 
> EXPORT_SYMBOL_GPL for this kinds of functionality, please.
> 

Thanks, I wasn't aware of the GPL-only export. I'll update this in a 
future series if we still need the export.
