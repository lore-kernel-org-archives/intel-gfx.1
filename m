Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB040C433F5
	for <intel-gfx@archiver.kernel.org>; Thu, 14 Apr 2022 13:59:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F47710FDC2;
	Thu, 14 Apr 2022 13:59:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7C1C10E8D0;
 Thu, 14 Apr 2022 13:59:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E4B56AADD7;
 Thu, 14 Apr 2022 13:59:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Thu, 14 Apr 2022 13:59:07 -0000
Message-ID: <164994474793.1345.10656993387511196107@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20220414123033.654198-1-jani.nikula@intel.com>
In-Reply-To: <20220414123033.654198-1-jani.nikula@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_add_support_for_enum_module_parameters?=
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
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: add support for enum module parameters
URL   : https://patchwork.freedesktop.org/series/102695/
State : warning

== Summary ==

Error: dim checkpatch failed
8c6849f919aa module: add enum module parameter type to map names to values
-:73: ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#73: FILE: include/linux/moduleparam.h:109:
+struct kparam_enum
+{

-:88: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#88: FILE: include/linux/moduleparam.h:503:
+extern int param_set_enum(const char *key, const struct kernel_param *kp);

-:89: CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
#89: FILE: include/linux/moduleparam.h:504:
+extern int param_get_enum(char *buffer, const struct kernel_param *kp);

-:116: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#116: FILE: include/linux/moduleparam.h:563:
+#define module_param_enum(name, enumerations, perm)			\
+	module_param_enum_named(name, name, enumerations, perm)

-:129: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'name' - possible side-effects?
#129: FILE: include/linux/moduleparam.h:576:
+#define module_param_enum_named(name, value, enumerations, perm)	\
+	param_check_int(name, &(value));				\
+	static const struct kparam_enum __param_arr_##name =		\
+	{								\
+		.enums = enumerations,					\
+		.num_enums = ARRAY_SIZE(enumerations),			\
+		.val = &value						\
+	};								\
+	__module_param_call(MODULE_PARAM_PREFIX, name,			\
+			    &param_ops_enum,				\
+			    .enumeration = &__param_arr_##name,		\
+			    perm, -1, 0);				\
+	__MODULE_PARM_TYPE(name, "enumeration")

-:129: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'value' - possible side-effects?
#129: FILE: include/linux/moduleparam.h:576:
+#define module_param_enum_named(name, value, enumerations, perm)	\
+	param_check_int(name, &(value));				\
+	static const struct kparam_enum __param_arr_##name =		\
+	{								\
+		.enums = enumerations,					\
+		.num_enums = ARRAY_SIZE(enumerations),			\
+		.val = &value						\
+	};								\
+	__module_param_call(MODULE_PARAM_PREFIX, name,			\
+			    &param_ops_enum,				\
+			    .enumeration = &__param_arr_##name,		\
+			    perm, -1, 0);				\
+	__MODULE_PARM_TYPE(name, "enumeration")

-:129: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'enumerations' - possible side-effects?
#129: FILE: include/linux/moduleparam.h:576:
+#define module_param_enum_named(name, value, enumerations, perm)	\
+	param_check_int(name, &(value));				\
+	static const struct kparam_enum __param_arr_##name =		\
+	{								\
+		.enums = enumerations,					\
+		.num_enums = ARRAY_SIZE(enumerations),			\
+		.val = &value						\
+	};								\
+	__module_param_call(MODULE_PARAM_PREFIX, name,			\
+			    &param_ops_enum,				\
+			    .enumeration = &__param_arr_##name,		\
+			    perm, -1, 0);				\
+	__MODULE_PARM_TYPE(name, "enumeration")

-:161: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around e->val
#161: FILE: kernel/params.c:544:
+			*(e->val) = e->enums[i].val;

-:178: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around e->val
#178: FILE: kernel/params.c:561:
+		if (*(e->val) == e->enums[i].val)

-:178: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around 'e->val'
#178: FILE: kernel/params.c:561:
+		if (*(e->val) == e->enums[i].val)

-:183: CHECK:UNNECESSARY_PARENTHESES: Unnecessary parentheses around e->val
#183: FILE: kernel/params.c:566:
+	       kp->name, *(e->val));

total: 1 errors, 0 warnings, 10 checks, 135 lines checked


